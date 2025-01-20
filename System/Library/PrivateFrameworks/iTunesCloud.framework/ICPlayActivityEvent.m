@interface ICPlayActivityEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isCollaborativePlaylist;
- (BOOL)isContinuityCameraUsed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEvent:(id)a3;
- (BOOL)isInternalBuild;
- (BOOL)isOffline;
- (BOOL)isSBEnabled;
- (Class)_mutableCopyClass;
- (ICPlayActivityAudioQualityProperties)providedAudioQuality;
- (ICPlayActivityAudioQualityProperties)targetedAudioQuality;
- (ICPlayActivityEnqueuerProperties)enqueuerProperties;
- (ICPlayActivityEvent)init;
- (ICPlayActivityEvent)initWithCoder:(id)a3;
- (ICPlayActivityEvent)initWithDataRepresentation:(id)a3;
- (ICPlayActivityEventContainerIDs)containerIDs;
- (ICPlayActivityEventItemIDs)itemIDs;
- (NSArray)buildFeatures;
- (NSData)dataRepresentation;
- (NSData)recommendationData;
- (NSData)timedMetadata;
- (NSData)trackInfo;
- (NSDate)eventDate;
- (NSNumber)isPrivateListeningEnabled;
- (NSNumber)isSiriInitiated;
- (NSString)buildVersion;
- (NSString)containerID;
- (NSString)deviceName;
- (NSString)externalID;
- (NSString)featureName;
- (NSString)householdID;
- (NSString)lyricsLanguage;
- (NSString)personalizedContainerID;
- (NSString)queueGroupingID;
- (NSString)requestingBundleIdentifier;
- (NSString)requestingBundleVersion;
- (NSString)storeFrontID;
- (NSString)storeID;
- (NSTimeZone)eventTimeZone;
- (double)itemDuration;
- (double)itemEndTime;
- (double)itemStartTime;
- (double)vocalAttenuationDuration;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)persistentID;
- (int64_t)sharedActivityType;
- (int64_t)systemReleaseType;
- (int64_t)version;
- (unint64_t)audioQualityPreference;
- (unint64_t)autoPlayMode;
- (unint64_t)containerType;
- (unint64_t)displayType;
- (unint64_t)endReasonType;
- (unint64_t)eventType;
- (unint64_t)itemType;
- (unint64_t)lyricsDisplayedCharacterCount;
- (unint64_t)mediaType;
- (unint64_t)playbackFormatPreference;
- (unint64_t)reasonHintType;
- (unint64_t)repeatPlayMode;
- (unint64_t)sharedActivityGroupSizeCurrent;
- (unint64_t)sharedActivityGroupSizeMax;
- (unint64_t)shufflePlayMode;
- (unint64_t)sourceType;
- (unint64_t)storeAccountID;
- (unint64_t)vocalAttenuationAvailability;
- (void)encodeWithCoder:(id)a3;
- (void)setVocalAttenuationAvailability:(unint64_t)a3;
- (void)setVocalAttenuationDuration:(double)a3;
@end

@implementation ICPlayActivityEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providedAudioQuality, 0);
  objc_storeStrong((id *)&self->_targetedAudioQuality, 0);
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_timedMetadata, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_siriInitiated, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_personalizedContainerID, 0);
  objc_storeStrong((id *)&self->_lyricsLanguage, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
  objc_storeStrong((id *)&self->_householdID, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_eventTimeZone, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_enqueuerProperties, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_containerIDs, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);

  objc_storeStrong((id *)&self->_buildFeatures, 0);
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (NSString)personalizedContainerID
{
  return self->_personalizedContainerID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setVocalAttenuationDuration:(double)a3
{
  self->_vocalAttenuationDuration = a3;
}

- (double)vocalAttenuationDuration
{
  return self->_vocalAttenuationDuration;
}

- (void)setVocalAttenuationAvailability:(unint64_t)a3
{
  self->_vocalAttenuationAvailability = a3;
}

- (unint64_t)vocalAttenuationAvailability
{
  return self->_vocalAttenuationAvailability;
}

- (BOOL)isCollaborativePlaylist
{
  return self->_collaborativePlaylist;
}

- (int64_t)sharedActivityType
{
  return self->_sharedActivityType;
}

- (unint64_t)sharedActivityGroupSizeMax
{
  return self->_sharedActivityGroupSizeMax;
}

- (unint64_t)sharedActivityGroupSizeCurrent
{
  return self->_sharedActivityGroupSizeCurrent;
}

- (ICPlayActivityAudioQualityProperties)providedAudioQuality
{
  return self->_providedAudioQuality;
}

- (ICPlayActivityAudioQualityProperties)targetedAudioQuality
{
  return self->_targetedAudioQuality;
}

- (unint64_t)playbackFormatPreference
{
  return self->_playbackFormatPreference;
}

- (unint64_t)audioQualityPreference
{
  return self->_audioQualityPreference;
}

- (NSData)trackInfo
{
  return self->_trackInfo;
}

- (NSData)timedMetadata
{
  return self->_timedMetadata;
}

- (int64_t)systemReleaseType
{
  return self->_systemReleaseType;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (NSNumber)isSiriInitiated
{
  return self->_siriInitiated;
}

- (unint64_t)shufflePlayMode
{
  return self->_shufflePlayMode;
}

- (BOOL)isSBEnabled
{
  return self->_SBEnabled;
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (unint64_t)repeatPlayMode
{
  return self->_repeatPlayMode;
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (unint64_t)reasonHintType
{
  return self->_reasonHintType;
}

- (NSString)queueGroupingID
{
  return self->_queueGroupingID;
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (BOOL)isOffline
{
  return self->_offline;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)lyricsLanguage
{
  return self->_lyricsLanguage;
}

- (unint64_t)lyricsDisplayedCharacterCount
{
  return self->_lyricsDisplayedCharacterCount;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (double)itemStartTime
{
  return self->_itemStartTime;
}

- (double)itemEndTime
{
  return self->_itemEndTime;
}

- (double)itemDuration
{
  return self->_itemDuration;
}

- (ICPlayActivityEventItemIDs)itemIDs
{
  return self->_itemIDs;
}

- (NSString)householdID
{
  return self->_householdID;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSTimeZone)eventTimeZone
{
  return self->_eventTimeZone;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (ICPlayActivityEnqueuerProperties)enqueuerProperties
{
  return self->_enqueuerProperties;
}

- (unint64_t)endReasonType
{
  return self->_endReasonType;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (BOOL)isContinuityCameraUsed
{
  return self->_continuityCameraUsed;
}

- (unint64_t)containerType
{
  return self->_containerType;
}

- (ICPlayActivityEventContainerIDs)containerIDs
{
  return self->_containerIDs;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSArray)buildFeatures
{
  return self->_buildFeatures;
}

- (unint64_t)autoPlayMode
{
  return self->_autoPlayMode;
}

- (Class)_mutableCopyClass
{
  return (Class)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)persistentID
{
  for (int64_t i = self->_persistentID; !i; self->_persistentID = i)
  {
    CFUUIDRef v4 = CFUUIDCreate(0);
    int64_t i = *(_OWORD *)&CFUUIDGetUUIDBytes(v4);
    CFRelease(v4);
  }
  return i;
}

- (BOOL)isInternalBuild
{
  return self->_systemReleaseType == 4;
}

- (NSData)dataRepresentation
{
  v3 = objc_alloc_init(ICPAPlayActivityEvent);
  unint64_t v4 = [(ICPlayActivityEvent *)self containerType];
  if (v4 - 1 > 3) {
    int v5 = 0;
  }
  else {
    int v5 = dword_1A3032C20[v4 - 1];
  }
  if (v3)
  {
    *(void *)&v3->_has |= 0x800000uLL;
    v3->_containerType = v5;
    BOOL v6 = [(ICPlayActivityEvent *)self isContinuityCameraUsed];
    *(void *)&v3->_has |= 0x800000000uLL;
    v3->_continuityCameraUsed = v6;
    v7 = [(ICPlayActivityEvent *)self deviceName];
    objc_storeStrong((id *)&v3->_deviceName, v7);

    unint64_t v8 = [(ICPlayActivityEvent *)self displayType];
    if (v8 - 1 < 3) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    *(void *)&v3->_has |= 0x1000000uLL;
    v3->_displayType = v9;
  }
  else
  {
    [(ICPlayActivityEvent *)self isContinuityCameraUsed];
    [(ICPlayActivityEvent *)self deviceName];

    [(ICPlayActivityEvent *)self displayType];
  }
  unint64_t v10 = [(ICPlayActivityEvent *)self endReasonType];
  if (v10 - 1 > 0xE) {
    int v11 = 0;
  }
  else {
    int v11 = dword_1A3032D78[v10 - 1];
  }
  if (v3)
  {
    *(void *)&v3->_has |= 0x2000000uLL;
    v3->_endReasonType = v11;
  }
  v12 = [(ICPlayActivityEvent *)self eventDate];
  [v12 timeIntervalSinceReferenceDate];
  if (v3)
  {
    *(void *)&v3->_has |= 0x10uLL;
    v3->_eventDateTimestamp = v13;
  }

  v14 = [(ICPlayActivityEvent *)self eventTimeZone];
  v15 = [v14 name];
  if (v3) {
    objc_storeStrong((id *)&v3->_eventTimeZoneName, v15);
  }

  v16 = [(ICPlayActivityEvent *)self featureName];
  v17 = v16;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_featureName, v16);

    [(ICPlayActivityEvent *)self itemDuration];
    *(void *)&v3->_has |= 0x80uLL;
    v3->_itemDuration = v18;
    [(ICPlayActivityEvent *)self itemEndTime];
    *(void *)&v3->_has |= 0x100uLL;
    v3->_itemEndTime = v19;
    [(ICPlayActivityEvent *)self itemStartTime];
    *(void *)&v3->_has |= 0x200uLL;
    v3->_itemStartTime = v20;
    unint64_t v21 = [(ICPlayActivityEvent *)self itemType];
    if (v21 - 1 < 9) {
      int v22 = v21;
    }
    else {
      int v22 = 0;
    }
    *(void *)&v3->_has |= 0x8000000uLL;
    v3->_itemType = v22;
    BOOL v23 = [(ICPlayActivityEvent *)self mediaType] == 1;
    *(void *)&v3->_has |= 0x10000000uLL;
    v3->_mediaType = v23;
    unint64_t v24 = [(ICPlayActivityEvent *)self lyricsDisplayedCharacterCount];
    *(void *)&v3->_has |= 1uLL;
    v3->_characterDisplayedCount = v24;
    v25 = [(ICPlayActivityEvent *)self lyricsLanguage];
    objc_storeStrong((id *)&v3->_lyricLanguage, v25);

    BOOL v26 = [(ICPlayActivityEvent *)self isOffline];
    *(void *)&v3->_has |= 0x4000000000uLL;
    v3->_offline = v26;
    int64_t v27 = [(ICPlayActivityEvent *)self persistentID];
    *(void *)&v3->_has |= 0x400uLL;
    v3->_persistentID = v27;
    v28 = [(ICPlayActivityEvent *)self queueGroupingID];
    objc_storeStrong((id *)&v3->_queueGroupingID, v28);
  }
  else
  {

    [(ICPlayActivityEvent *)self itemDuration];
    [(ICPlayActivityEvent *)self itemEndTime];
    [(ICPlayActivityEvent *)self itemStartTime];
    [(ICPlayActivityEvent *)self itemType];
    [(ICPlayActivityEvent *)self mediaType];
    [(ICPlayActivityEvent *)self lyricsDisplayedCharacterCount];
    [(ICPlayActivityEvent *)self lyricsLanguage];

    [(ICPlayActivityEvent *)self isOffline];
    [(ICPlayActivityEvent *)self persistentID];
    v28 = [(ICPlayActivityEvent *)self queueGroupingID];
  }

  v29 = [(ICPlayActivityEvent *)self recommendationData];
  v30 = v29;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_recommendationData, v29);

    BOOL SBEnabled = self->_SBEnabled;
    *(void *)&v3->_has |= 0x10000000000uLL;
    v3->_sBEnabled = SBEnabled;
    unint64_t v32 = [(ICPlayActivityEvent *)self sourceType];
    int v33 = v32 == 1;
    if (v32 == 2) {
      int v33 = 2;
    }
    *(void *)&v3->_has |= 0x100000000uLL;
    v3->_sourceType = v33;
    unint64_t v34 = [(ICPlayActivityEvent *)self storeAccountID];
    *(void *)&v3->_has |= 0x20000uLL;
    v3->_storeAccountID = v34;
    v35 = [(ICPlayActivityEvent *)self storeFrontID];
    objc_storeStrong((id *)&v3->_storeFrontID, v35);
  }
  else
  {

    [(ICPlayActivityEvent *)self sourceType];
    [(ICPlayActivityEvent *)self storeAccountID];
    v35 = [(ICPlayActivityEvent *)self storeFrontID];
  }

  v36 = [(ICPlayActivityEvent *)self timedMetadata];
  if (v3) {
    objc_storeStrong((id *)&v3->_timedMetadata, v36);
  }

  v37 = [(ICPlayActivityEvent *)self trackInfo];
  if (v3) {
    objc_storeStrong((id *)&v3->_trackInfo, v37);
  }

  v38 = [(ICPlayActivityEvent *)self requestingBundleIdentifier];
  if (v3) {
    objc_storeStrong((id *)&v3->_requestingBundleIdentifier, v38);
  }

  v39 = [(ICPlayActivityEvent *)self requestingBundleVersion];
  v40 = v39;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_requestingBundleVersion, v39);

    int64_t v41 = [(ICPlayActivityEvent *)self systemReleaseType];
    if ((unint64_t)(v41 - 1) < 4) {
      int v42 = v41;
    }
    else {
      int v42 = 0;
    }
    *(void *)&v3->_has |= 0x200000000uLL;
    v3->_systemReleaseType = v42;
    unint64_t v43 = [(ICPlayActivityEvent *)self sharedActivityGroupSizeCurrent];
    *(void *)&v3->_has |= 0x4000uLL;
    v3->_sharedActivityGroupSizeCurrent = v43;
    unint64_t v44 = [(ICPlayActivityEvent *)self sharedActivityGroupSizeMax];
    *(void *)&v3->_has |= 0x8000uLL;
    v3->_sharedActivityGroupSizeMax = v44;
  }
  else
  {

    [(ICPlayActivityEvent *)self systemReleaseType];
    [(ICPlayActivityEvent *)self sharedActivityGroupSizeCurrent];
    [(ICPlayActivityEvent *)self sharedActivityGroupSizeMax];
  }
  int64_t v45 = [(ICPlayActivityEvent *)self sharedActivityType];
  if ((unint64_t)(v45 - 1) > 5) {
    int v46 = 0;
  }
  else {
    int v46 = dword_1A3032D60[v45 - 1];
  }
  if (v3)
  {
    *(void *)&v3->_has |= 0x80000000uLL;
    v3->_sharedActivityType = v46;
    BOOL v47 = [(ICPlayActivityEvent *)self isCollaborativePlaylist];
    *(void *)&v3->_has |= 0x2000000000uLL;
    v3->_isCollaborativePlaylist = v47;
    unint64_t v48 = [(ICPlayActivityEvent *)self vocalAttenuationAvailability];
    int v49 = v48 == 1;
    if (v48 == 2) {
      int v49 = 2;
    }
    *(void *)&v3->_has |= 0x400000000uLL;
    v3->_vocalAttenuationAvailibility = v49;
    [(ICPlayActivityEvent *)self vocalAttenuationDuration];
    *(void *)&v3->_has |= 0x200000uLL;
    v3->_vocalAttenuationDuration = v50;
    unint64_t v51 = [(ICPlayActivityEvent *)self audioQualityPreference];
    if (v51 - 1 < 4) {
      int v52 = v51;
    }
    else {
      int v52 = 0;
    }
    *(void *)&v3->_has |= 0x400000uLL;
    v3->_audioQualityPreference = v52;
    unint64_t v53 = [(ICPlayActivityEvent *)self playbackFormatPreference];
    int v54 = v53 == 1;
    if (v53 == 2) {
      int v54 = 2;
    }
    *(void *)&v3->_has |= 0x20000000uLL;
    v3->_playbackFormatPreference = v54;
  }
  else
  {
    [(ICPlayActivityEvent *)self isCollaborativePlaylist];
    [(ICPlayActivityEvent *)self vocalAttenuationAvailability];
    [(ICPlayActivityEvent *)self vocalAttenuationDuration];
    [(ICPlayActivityEvent *)self audioQualityPreference];
    [(ICPlayActivityEvent *)self playbackFormatPreference];
  }
  v55 = [(ICPlayActivityEvent *)self targetedAudioQuality];
  v135 = v55;
  if (v55)
  {
    v56 = objc_alloc_init(ICPAAudioQualityDictionary);
    uint64_t v57 = [v55 bitDepth];
    if (v56)
    {
      *(unsigned char *)&v56->_has |= 1u;
      v56->_bitDepth = v57;
      uint64_t v58 = [v55 bitRate];
      *(unsigned char *)&v56->_has |= 2u;
      v56->_bitRate = v58;
    }
    else
    {
      [v55 bitRate];
    }
    v59 = [v55 channelLayoutDescription];
    -[ICPAAudioQualityDictionary setChannelLayoutDescription:]((uint64_t)v56, v59);

    v55 = v135;
    unsigned int v60 = [v135 codec];
    if (v56)
    {
      *(unsigned char *)&v56->_has |= 8u;
      v56->_codec = v60;
      uint64_t v61 = [v135 sampleRate];
      *(unsigned char *)&v56->_has |= 4u;
      v56->_sampleRate = v61;
      char v62 = [v135 isSpatialized];
      *(unsigned char *)&v56->_has |= 0x10u;
      v56->_isSpatialized = v62;
      if (!v3)
      {
LABEL_56:

        goto LABEL_57;
      }
    }
    else
    {
      [v135 sampleRate];
      [v135 isSpatialized];
      if (!v3) {
        goto LABEL_56;
      }
    }
    objc_storeStrong((id *)&v3->_targetedAudioQuality, v56);
    goto LABEL_56;
  }
LABEL_57:
  v133 = [(ICPlayActivityEvent *)self providedAudioQuality];
  if (v133)
  {
    v63 = objc_alloc_init(ICPAAudioQualityDictionary);
    uint64_t v64 = [v133 bitDepth];
    if (v63)
    {
      *(unsigned char *)&v63->_has |= 1u;
      v63->_bitDepth = v64;
      uint64_t v65 = [v133 bitRate];
      *(unsigned char *)&v63->_has |= 2u;
      v63->_bitRate = v65;
    }
    else
    {
      [v133 bitRate];
    }
    v66 = [v133 channelLayoutDescription];
    -[ICPAAudioQualityDictionary setChannelLayoutDescription:]((uint64_t)v63, v66);

    unsigned int v67 = [v133 codec];
    if (v63)
    {
      *(unsigned char *)&v63->_has |= 8u;
      v63->_codec = v67;
      uint64_t v68 = [v133 sampleRate];
      *(unsigned char *)&v63->_has |= 4u;
      v63->_sampleRate = v68;
      char v69 = [v133 isSpatialized];
      *(unsigned char *)&v63->_has |= 0x10u;
      v63->_isSpatialized = v69;
    }
    else
    {
      [v133 sampleRate];
      [v133 isSpatialized];
    }
    v55 = v135;
    if (v3) {
      objc_storeStrong((id *)&v3->_providedAudioQuality, v63);
    }
  }
  v134 = [(ICPlayActivityEvent *)self enqueuerProperties];
  if (v134)
  {
    v70 = objc_alloc_init(ICPAPlayActivityEnqueuerProperties);
    v71 = v134;
    v72 = [v134 buildVersion];
    if (v72 && v70) {
      objc_storeStrong((id *)&v70->_buildVersion, v72);
    }
    v73 = [v134 deviceGUID];
    if (v73 && v70) {
      objc_storeStrong((id *)&v70->_deviceGUID, v73);
    }
    v74 = [v134 deviceName];
    if (v74 && v70) {
      objc_storeStrong((id *)&v70->_deviceName, v74);
    }
    v75 = objc_msgSend(v134, "isPrivateListeningEnabled", v72);
    v76 = v75;
    if (v75)
    {
      char v77 = [v75 BOOLValue];
      if (v70)
      {
        *(unsigned char *)&v70->_has |= 4u;
        v70->_privateListeningEnabled = v77;
      }
    }
    v78 = [v134 timeZone];
    v79 = v78;
    if (v78)
    {
      v80 = [v78 name];
      if (v70) {
        objc_storeStrong((id *)&v70->_timeZoneName, v80);
      }

      v71 = v134;
    }
    uint64_t v81 = [v71 systemReleaseType];
    if (v70)
    {
      if ((unint64_t)(v81 - 1) < 4) {
        int v82 = v81;
      }
      else {
        int v82 = 0;
      }
      *(unsigned char *)&v70->_has |= 2u;
      v70->_systemReleaseType = v82;
      char v83 = [v71 isSBEnabled];
      *(unsigned char *)&v70->_has |= 8u;
      v70->_sBEnabled = v83;
      uint64_t v84 = [v71 storeAccountID];
      if (v84)
      {
        *(unsigned char *)&v70->_has |= 1u;
        v70->_storeAccountID = v84;
      }
    }
    else
    {
      [v71 isSBEnabled];
      [v71 storeAccountID];
    }
    v85 = [v71 storeFrontID];
    if (v85 && v70) {
      objc_storeStrong((id *)&v70->_storeFrontID, v85);
    }
    if (v3) {
      objc_storeStrong((id *)&v3->_enqueuerProperties, v70);
    }

    v55 = v135;
  }
  v86 = [(ICPlayActivityEvent *)self householdID];
  if (v3) {
    objc_storeStrong((id *)&v3->_householdID, v86);
  }

  v87 = [(ICPlayActivityEvent *)self isPrivateListeningEnabled];
  v88 = v87;
  if (v87)
  {
    char v89 = [v87 BOOLValue];
    if (v3)
    {
      *(void *)&v3->_has |= 0x8000000000uLL;
      v3->_privateListeningEnabled = v89;
    }
  }
  v90 = [(ICPlayActivityEvent *)self isSiriInitiated];
  v91 = v90;
  if (v90)
  {
    char v92 = [v90 BOOLValue];
    if (v3)
    {
      *(void *)&v3->_has |= 0x20000000000uLL;
      v3->_siriInitiated = v92;
    }
  }
  if (self->_version > 1)
  {
    v97 = objc_alloc_init(ICPAPlayModeDictionary);
    unint64_t v99 = [(ICPlayActivityEvent *)self autoPlayMode];
    if (v97)
    {
      if (v99 - 1 < 3) {
        int v100 = v99;
      }
      else {
        int v100 = 0;
      }
      *(unsigned char *)&v97->_has |= 1u;
      v97->_autoPlayMode = v100;
      unint64_t v101 = [(ICPlayActivityEvent *)self repeatPlayMode];
      if (v101 - 1 < 3) {
        int v102 = v101;
      }
      else {
        int v102 = 0;
      }
      *(unsigned char *)&v97->_has |= 2u;
      v97->_repeatPlayMode = v102;
      unint64_t v103 = [(ICPlayActivityEvent *)self shufflePlayMode];
      int v104 = v103 == 1;
      if (v103 == 2) {
        int v104 = 2;
      }
      *(unsigned char *)&v97->_has |= 4u;
      v97->_shufflePlayMode = v104;
      if (!v3) {
        goto LABEL_122;
      }
    }
    else
    {
      [(ICPlayActivityEvent *)self repeatPlayMode];
      [(ICPlayActivityEvent *)self shufflePlayMode];
      if (!v3) {
        goto LABEL_122;
      }
    }
    objc_storeStrong((id *)&v3->_playMode, v97);
LABEL_122:
    id v105 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v106 = [(ICPlayActivityEvent *)self buildFeatures];
    v107 = (void *)[v105 initWithArray:v106];
    if (v3) {
      objc_storeStrong((id *)&v3->_buildFeatures, v107);
    }

    v108 = [(ICPlayActivityEvent *)self buildVersion];
    v109 = v108;
    if (v3)
    {
      objc_storeStrong((id *)&v3->_buildVersion, v108);

      unint64_t v110 = [(ICPlayActivityEvent *)self eventType];
      if (v110 == 1) {
        int v111 = 2;
      }
      else {
        int v111 = 1;
      }
      if (v110 == 2) {
        int v111 = 3;
      }
      *(void *)&v3->_has |= 0x4000000uLL;
      v3->_eventType = v111;
      BOOL v112 = [(ICPlayActivityEvent *)self reasonHintType] == 1;
      *(void *)&v3->_has |= 0x40000000uLL;
      v3->_reasonHintType = v112;
    }
    else
    {

      [(ICPlayActivityEvent *)self eventType];
      [(ICPlayActivityEvent *)self reasonHintType];
    }
    v55 = v135;
    storeID = [(ICPlayActivityEvent *)self containerIDs];
    uint64_t v113 = [storeID adamID];
    if (v3)
    {
      *(void *)&v3->_has |= 4uLL;
      v3->_containerAdamID = v113;
      v114 = [storeID globalPlaylistID];
      objc_storeStrong((id *)&v3->_globalPlaylistID, v114);
    }
    else
    {
      v114 = [storeID globalPlaylistID];
    }

    v115 = [storeID playlistVersionHash];
    if (v3) {
      objc_storeStrong((id *)&v3->_playlistVersionHash, v115);
    }

    v116 = [storeID stationHash];
    if (v3) {
      objc_storeStrong((id *)&v3->_stationHash, v116);
    }

    v117 = [storeID stationStringID];
    v118 = v117;
    if (v3)
    {
      objc_storeStrong((id *)&v3->_stationStringID, v117);

      uint64_t v119 = [storeID stationID];
      *(void *)&v3->_has |= 0x10000uLL;
      v3->_stationID = v119;
      v120 = [storeID cloudAlbumID];
      objc_storeStrong((id *)&v3->_cloudAlbumID, v120);

      uint64_t v121 = [storeID cloudPlaylistID];
      *(void *)&v3->_has |= 2uLL;
      v3->_cloudPlaylistID = v121;
    }
    else
    {

      [storeID stationID];
      [storeID cloudAlbumID];

      [storeID cloudPlaylistID];
    }
    v122 = [(ICPlayActivityEvent *)self itemIDs];
    uint64_t v123 = [v122 subscriptionAdamID];
    if (v3)
    {
      *(void *)&v3->_has |= 0x40000uLL;
      v3->_subscriptionAdamID = v123;
      uint64_t v124 = [v122 purchasedAdamID];
      *(void *)&v3->_has |= 0x800uLL;
      v3->_purchasedAdamID = v124;
      uint64_t v125 = [v122 radioAdamID];
      *(void *)&v3->_has |= 0x1000uLL;
      v3->_radioAdamID = v125;
      uint64_t v126 = [v122 cloudID];
      *(void *)&v3->_has |= 0x40uLL;
      v3->_itemCloudID = v126;
      v127 = [v122 lyricsID];
      objc_storeStrong((id *)&v3->_lyricsID, v127);

      uint64_t v128 = [v122 equivalencySourceAdamID];
      *(void *)&v3->_has |= 8uLL;
      v3->_equivalencySourceAdamID = v128;
      uint64_t v129 = [v122 reportingAdamID];
      *(void *)&v3->_has |= 0x2000uLL;
      v3->_reportingAdamID = v129;
    }
    else
    {
      [v122 purchasedAdamID];
      [v122 radioAdamID];
      [v122 cloudID];
      [v122 lyricsID];

      [v122 equivalencySourceAdamID];
      [v122 reportingAdamID];
    }

    goto LABEL_142;
  }
  v93 = [(ICPlayActivityEvent *)self containerID];
  if (v3) {
    objc_storeStrong((id *)&v3->_containerID, v93);
  }

  v94 = [(ICPlayActivityEvent *)self externalID];
  if (v3) {
    objc_storeStrong((id *)&v3->_externalID, v94);
  }

  v95 = [(ICPlayActivityEvent *)self personalizedContainerID];
  if (v3) {
    objc_storeStrong((id *)&v3->_personalizedContainerID, v95);
  }

  v96 = [(ICPlayActivityEvent *)self storeID];
  v97 = v96;
  if (v3)
  {
    v97 = v96;
    storeID = v3->_storeID;
    v3->_storeID = (NSString *)&v97->super.super.isa;
LABEL_142:
  }
  v130 = [(ICPAPlayActivityEvent *)v3 data];

  return (NSData *)v130;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int v5 = [(ICPlayActivityEvent *)self _mutableCopyClass];
  uint64_t v6 = [[(objc_class *)v5 allocWithZone:a3] init];

  if (v6)
  {
    *(void *)(v6 + 8) = self->_autoPlayMode;
    objc_storeStrong((id *)(v6 + 16), self->_buildFeatures);
    objc_storeStrong((id *)(v6 + 24), self->_buildVersion);
    objc_storeStrong((id *)(v6 + 32), self->_containerID);
    objc_storeStrong((id *)(v6 + 40), self->_containerIDs);
    *(void *)(v6 + 48) = self->_containerType;
    *(unsigned char *)(v6 + 56) = self->_continuityCameraUsed;
    objc_storeStrong((id *)(v6 + 64), self->_deviceName);
    *(void *)(v6 + 72) = self->_displayType;
    *(void *)(v6 + 80) = self->_endReasonType;
    objc_storeStrong((id *)(v6 + 88), self->_enqueuerProperties);
    objc_storeStrong((id *)(v6 + 96), self->_eventDate);
    objc_storeStrong((id *)(v6 + 104), self->_eventTimeZone);
    *(void *)(v6 + 112) = self->_eventType;
    objc_storeStrong((id *)(v6 + 120), self->_externalID);
    objc_storeStrong((id *)(v6 + 136), self->_householdID);
    objc_storeStrong((id *)(v6 + 128), self->_featureName);
    objc_storeStrong((id *)(v6 + 144), self->_itemIDs);
    *(double *)(v6 + 152) = self->_itemDuration;
    *(double *)(v6 + 160) = self->_itemEndTime;
    *(double *)(v6 + 168) = self->_itemStartTime;
    *(void *)(v6 + 176) = self->_itemType;
    *(void *)(v6 + 184) = self->_lyricsDisplayedCharacterCount;
    objc_storeStrong((id *)(v6 + 192), self->_lyricsLanguage);
    *(void *)(v6 + 200) = self->_mediaType;
    *(unsigned char *)(v6 + 208) = self->_offline;
    *(void *)(v6 + 216) = self->_persistentID;
    objc_storeStrong((id *)(v6 + 224), self->_personalizedContainerID);
    objc_storeStrong((id *)(v6 + 232), self->_privateListeningEnabled);
    objc_storeStrong((id *)(v6 + 240), self->_queueGroupingID);
    *(void *)(v6 + 248) = self->_reasonHintType;
    objc_storeStrong((id *)(v6 + 256), self->_recommendationData);
    *(void *)(v6 + 264) = self->_repeatPlayMode;
    objc_storeStrong((id *)(v6 + 272), self->_requestingBundleIdentifier);
    objc_storeStrong((id *)(v6 + 280), self->_requestingBundleVersion);
    *(unsigned char *)(v6 + 288) = self->_SBEnabled;
    *(void *)(v6 + 296) = self->_shufflePlayMode;
    objc_storeStrong((id *)(v6 + 304), self->_siriInitiated);
    *(void *)(v6 + 312) = self->_sourceType;
    *(void *)(v6 + 328) = self->_storeAccountID;
    objc_storeStrong((id *)(v6 + 336), self->_storeFrontID);
    objc_storeStrong((id *)(v6 + 344), self->_storeID);
    *(void *)(v6 + 320) = self->_systemReleaseType;
    objc_storeStrong((id *)(v6 + 352), self->_timedMetadata);
    objc_storeStrong((id *)(v6 + 360), self->_trackInfo);
    *(void *)(v6 + 368) = self->_version;
    *(void *)(v6 + 376) = self->_audioQualityPreference;
    *(void *)(v6 + 384) = self->_playbackFormatPreference;
    objc_storeStrong((id *)(v6 + 392), self->_targetedAudioQuality);
    objc_storeStrong((id *)(v6 + 400), self->_providedAudioQuality);
    *(void *)(v6 + 408) = self->_sharedActivityGroupSizeCurrent;
    *(void *)(v6 + 416) = self->_sharedActivityGroupSizeMax;
    *(void *)(v6 + 424) = self->_sharedActivityType;
    *(unsigned char *)(v6 + 432) = self->_collaborativePlaylist;
    *(void *)(v6 + 440) = self->_vocalAttenuationAvailability;
    *(double *)(v6 + 448) = self->_vocalAttenuationDuration;
  }
  return (id)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(ICPlayActivityEvent *)self dataRepresentation];
  if ([v4 length]) {
    [v5 encodeObject:v4 forKey:@"_ICPlayActivityEventCoderDataRepresentation"];
  }
}

- (ICPlayActivityEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ICPlayActivityEventCoderDataRepresentation"];

  uint64_t v6 = [(ICPlayActivityEvent *)self initWithDataRepresentation:v5];
  return v6;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4 = a3;
  if (![(ICPlayActivityEvent *)self isEqual:v4]) {
    goto LABEL_103;
  }
  unint64_t autoPlayMode = self->_autoPlayMode;
  if (autoPlayMode != [v4 autoPlayMode]) {
    goto LABEL_103;
  }
  buildFeatures = self->_buildFeatures;
  v7 = [v4 buildFeatures];
  if (buildFeatures == v7)
  {
  }
  else
  {
    unint64_t v8 = v7;
    int v9 = [(NSArray *)buildFeatures isEqual:v7];

    if (!v9) {
      goto LABEL_103;
    }
  }
  unint64_t containerType = self->_containerType;
  if (containerType != [v4 containerType]) {
    goto LABEL_103;
  }
  int continuityCameraUsed = self->_continuityCameraUsed;
  if (continuityCameraUsed != [v4 isContinuityCameraUsed]) {
    goto LABEL_103;
  }
  deviceName = self->_deviceName;
  double v13 = [v4 deviceName];
  if (deviceName == v13)
  {
  }
  else
  {
    v14 = v13;
    int v15 = [(NSString *)deviceName isEqual:v13];

    if (!v15) {
      goto LABEL_103;
    }
  }
  unint64_t displayType = self->_displayType;
  if (displayType != [v4 displayType]) {
    goto LABEL_103;
  }
  unint64_t endReasonType = self->_endReasonType;
  if (endReasonType != [v4 endReasonType]) {
    goto LABEL_103;
  }
  eventDate = self->_eventDate;
  double v19 = [v4 eventDate];
  if (eventDate == v19)
  {
  }
  else
  {
    double v20 = v19;
    int v21 = [(NSDate *)eventDate isEqual:v19];

    if (!v21) {
      goto LABEL_103;
    }
  }
  eventTimeZone = self->_eventTimeZone;
  BOOL v23 = [v4 eventTimeZone];
  if (eventTimeZone == v23)
  {
  }
  else
  {
    unint64_t v24 = v23;
    int v25 = [(NSTimeZone *)eventTimeZone isEqual:v23];

    if (!v25) {
      goto LABEL_103;
    }
  }
  unint64_t eventType = self->_eventType;
  if (eventType != [v4 eventType]) {
    goto LABEL_103;
  }
  externalID = self->_externalID;
  v28 = [v4 externalID];
  if (externalID == v28)
  {
  }
  else
  {
    v29 = v28;
    int v30 = [(NSString *)externalID isEqual:v28];

    if (!v30) {
      goto LABEL_103;
    }
  }
  featureName = self->_featureName;
  unint64_t v32 = [v4 featureName];
  if (featureName == v32)
  {
  }
  else
  {
    int v33 = v32;
    int v34 = [(NSString *)featureName isEqual:v32];

    if (!v34) {
      goto LABEL_103;
    }
  }
  householdID = self->_householdID;
  v36 = [v4 householdID];
  if (householdID == v36)
  {
  }
  else
  {
    v37 = v36;
    int v38 = [(NSString *)householdID isEqual:v36];

    if (!v38) {
      goto LABEL_103;
    }
  }
  double itemDuration = self->_itemDuration;
  [v4 itemDuration];
  if (itemDuration != v40) {
    goto LABEL_103;
  }
  double itemEndTime = self->_itemEndTime;
  [v4 itemEndTime];
  if (itemEndTime != v42) {
    goto LABEL_103;
  }
  double itemStartTime = self->_itemStartTime;
  [v4 itemStartTime];
  if (itemStartTime != v44) {
    goto LABEL_103;
  }
  unint64_t itemType = self->_itemType;
  if (itemType != [v4 itemType]) {
    goto LABEL_103;
  }
  unint64_t lyricsDisplayedCharacterCount = self->_lyricsDisplayedCharacterCount;
  if (lyricsDisplayedCharacterCount != [v4 lyricsDisplayedCharacterCount]) {
    goto LABEL_103;
  }
  lyricsLanguage = self->_lyricsLanguage;
  unint64_t v48 = [v4 lyricsLanguage];
  if (lyricsLanguage == v48)
  {
  }
  else
  {
    int v49 = v48;
    int v50 = [(NSString *)lyricsLanguage isEqual:v48];

    if (!v50) {
      goto LABEL_103;
    }
  }
  unint64_t mediaType = self->_mediaType;
  if (mediaType != [v4 mediaType]) {
    goto LABEL_103;
  }
  int offline = self->_offline;
  if (offline != [v4 isOffline]) {
    goto LABEL_103;
  }
  int64_t persistentID = self->_persistentID;
  if (persistentID != [v4 persistentID]) {
    goto LABEL_103;
  }
  privateListeningEnabled = self->_privateListeningEnabled;
  v55 = [v4 isPrivateListeningEnabled];
  if (privateListeningEnabled == v55)
  {
  }
  else
  {
    v56 = v55;
    int v57 = [(NSNumber *)privateListeningEnabled isEqual:v55];

    if (!v57) {
      goto LABEL_103;
    }
  }
  queueGroupingID = self->_queueGroupingID;
  v59 = [v4 queueGroupingID];
  if (queueGroupingID == v59)
  {
  }
  else
  {
    unsigned int v60 = v59;
    int v61 = [(NSString *)queueGroupingID isEqual:v59];

    if (!v61) {
      goto LABEL_103;
    }
  }
  unint64_t reasonHintType = self->_reasonHintType;
  if (reasonHintType != [v4 reasonHintType]) {
    goto LABEL_103;
  }
  recommendationData = self->_recommendationData;
  uint64_t v64 = [v4 recommendationData];
  if (recommendationData == v64)
  {
  }
  else
  {
    uint64_t v65 = v64;
    int v66 = [(NSData *)recommendationData isEqual:v64];

    if (!v66) {
      goto LABEL_103;
    }
  }
  unint64_t repeatPlayMode = self->_repeatPlayMode;
  if (repeatPlayMode != [v4 repeatPlayMode]) {
    goto LABEL_103;
  }
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  char v69 = [v4 requestingBundleIdentifier];
  if (requestingBundleIdentifier == v69)
  {
  }
  else
  {
    v70 = v69;
    int v71 = [(NSString *)requestingBundleIdentifier isEqual:v69];

    if (!v71) {
      goto LABEL_103;
    }
  }
  v72 = self->_requestingBundleIdentifier;
  v73 = [v4 requestingBundleIdentifier];
  if (v72 == v73)
  {
  }
  else
  {
    v74 = v73;
    int v75 = [(NSString *)v72 isEqual:v73];

    if (!v75) {
      goto LABEL_103;
    }
  }
  requestingBundleVersion = self->_requestingBundleVersion;
  char v77 = [v4 requestingBundleVersion];
  if (requestingBundleVersion == v77)
  {
  }
  else
  {
    v78 = v77;
    int v79 = [(NSString *)requestingBundleVersion isEqual:v77];

    if (!v79) {
      goto LABEL_103;
    }
  }
  int SBEnabled = self->_SBEnabled;
  if (SBEnabled != [v4 isSBEnabled])
  {
LABEL_103:
    BOOL v110 = 0;
    goto LABEL_104;
  }
  siriInitiated = self->_siriInitiated;
  int v82 = [v4 isSiriInitiated];
  if (siriInitiated == v82)
  {
  }
  else
  {
    char v83 = v82;
    int v84 = [(NSNumber *)siriInitiated isEqual:v82];

    if (!v84) {
      goto LABEL_103;
    }
  }
  unint64_t shufflePlayMode = self->_shufflePlayMode;
  if (shufflePlayMode != [v4 shufflePlayMode]) {
    goto LABEL_103;
  }
  unint64_t sourceType = self->_sourceType;
  if (sourceType != [v4 sourceType]) {
    goto LABEL_103;
  }
  int64_t systemReleaseType = self->_systemReleaseType;
  if (systemReleaseType != [v4 systemReleaseType]) {
    goto LABEL_103;
  }
  unint64_t storeAccountID = self->_storeAccountID;
  if (storeAccountID != [v4 storeAccountID]) {
    goto LABEL_103;
  }
  storeFrontID = self->_storeFrontID;
  v90 = [v4 storeFrontID];
  if (storeFrontID == v90)
  {
  }
  else
  {
    v91 = v90;
    int v92 = [(NSString *)storeFrontID isEqual:v90];

    if (!v92) {
      goto LABEL_103;
    }
  }
  timedMetadata = self->_timedMetadata;
  v94 = [v4 timedMetadata];
  if (timedMetadata == v94)
  {
  }
  else
  {
    v95 = v94;
    int v96 = [(NSData *)timedMetadata isEqual:v94];

    if (!v96) {
      goto LABEL_103;
    }
  }
  trackInfo = self->_trackInfo;
  v98 = [v4 trackInfo];
  if (trackInfo == v98)
  {
  }
  else
  {
    unint64_t v99 = v98;
    int v100 = [(NSData *)trackInfo isEqual:v98];

    if (!v100) {
      goto LABEL_103;
    }
  }
  unint64_t audioQualityPreference = self->_audioQualityPreference;
  if (audioQualityPreference != [v4 audioQualityPreference]) {
    goto LABEL_103;
  }
  unint64_t playbackFormatPreference = self->_playbackFormatPreference;
  if (playbackFormatPreference != [v4 playbackFormatPreference]) {
    goto LABEL_103;
  }
  unint64_t sharedActivityGroupSizeCurrent = self->_sharedActivityGroupSizeCurrent;
  if (sharedActivityGroupSizeCurrent != [v4 sharedActivityGroupSizeCurrent]) {
    goto LABEL_103;
  }
  unint64_t sharedActivityGroupSizeMax = self->_sharedActivityGroupSizeMax;
  if (sharedActivityGroupSizeMax != [v4 sharedActivityGroupSizeMax]) {
    goto LABEL_103;
  }
  int64_t sharedActivityType = self->_sharedActivityType;
  if (sharedActivityType != [v4 sharedActivityType]) {
    goto LABEL_103;
  }
  int collaborativePlaylist = self->_collaborativePlaylist;
  if (collaborativePlaylist != [v4 isCollaborativePlaylist]) {
    goto LABEL_103;
  }
  unint64_t vocalAttenuationAvailability = self->_vocalAttenuationAvailability;
  if (vocalAttenuationAvailability != [v4 vocalAttenuationAvailability]) {
    goto LABEL_103;
  }
  double vocalAttenuationDuration = self->_vocalAttenuationDuration;
  [v4 vocalAttenuationDuration];
  BOOL v110 = vocalAttenuationDuration == v109;
LABEL_104:

  return v110;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICPlayActivityEvent *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(ICPlayActivityEvent *)self persistentID];
      BOOL v6 = v5 == [(ICPlayActivityEvent *)v4 persistentID];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@ %p persistentID:%llu version:%lu\n", v5, self, -[ICPlayActivityEvent persistentID](self, "persistentID"), self->_version];

  objc_msgSend(v6, "appendFormat:", @"    eventType: %lu\n", self->_eventType);
  if (self->_containerID) {
    [v6 appendFormat:@"    containerID:'%@'\n", self->_containerID];
  }
  if (self->_containerIDs) {
    [v6 appendFormat:@"    containerIDs:'%@'\n", self->_containerIDs];
  }
  if (self->_containerType) {
    objc_msgSend(v6, "appendFormat:", @"    containerType:%td\n", self->_containerType);
  }
  if (self->_continuityCameraUsed) {
    v7 = @"true";
  }
  else {
    v7 = @"false";
  }
  [v6 appendFormat:@"    continuityCameraUsed:%@\n", v7];
  if (self->_deviceName) {
    [v6 appendFormat:@"    deviceName:'%@'\n", self->_deviceName];
  }
  objc_msgSend(v6, "appendFormat:", @"    endReasonType:%td\n", self->_endReasonType);
  if (self->_enqueuerProperties) {
    [v6 appendFormat:@"    enqueuerProperties:'%@'\n", self->_enqueuerProperties];
  }
  if (self->_eventDate) {
    [v6 appendFormat:@"    eventDate:%@\n", self->_eventDate];
  }
  if (self->_eventTimeZone) {
    [v6 appendFormat:@"    eventTimeZone:%@\n", self->_eventTimeZone];
  }
  if (self->_externalID) {
    [v6 appendFormat:@"    externalID:'%@'\n", self->_externalID];
  }
  if (self->_featureName) {
    [v6 appendFormat:@"    featureName:'%@'\n", self->_featureName];
  }
  if (self->_householdID) {
    [v6 appendFormat:@"    householdID:'%@'\n", self->_householdID];
  }
  if (self->_systemReleaseType) {
    objc_msgSend(v6, "appendFormat:", @"    systemReleaseType: %li\n", self->_systemReleaseType);
  }
  objc_msgSend(v6, "appendFormat:", @"    itemDuration:%f\n    itemStartTime:%f  \n    itemEndTime:%f\n", *(void *)&self->_itemDuration, *(void *)&self->_itemStartTime, *(void *)&self->_itemEndTime);
  objc_msgSend(v6, "appendFormat:", @"    itemType:%td\n", self->_itemType);
  if (self->_itemIDs) {
    [v6 appendFormat:@"    itemIDs:'%@'\n", self->_itemIDs];
  }
  objc_msgSend(v6, "appendFormat:", @"    mediaType:%td\n", self->_mediaType);
  if (self->_offline) {
    unint64_t v8 = @"true";
  }
  else {
    unint64_t v8 = @"false";
  }
  [v6 appendFormat:@"    offline:%@\n", v8];
  if (self->_personalizedContainerID) {
    [v6 appendFormat:@"    personalizedContainerID:'%@'\n", self->_personalizedContainerID];
  }
  if (self->_queueGroupingID) {
    [v6 appendFormat:@"    queueGroupingID:'%@'\n", self->_queueGroupingID];
  }
  if (self->_recommendationData) {
    [v6 appendFormat:@"    hasRecommendationData:true\n"];
  }
  privateListeningEnabled = self->_privateListeningEnabled;
  if (privateListeningEnabled)
  {
    if ([(NSNumber *)privateListeningEnabled BOOLValue]) {
      unint64_t v10 = @"YES";
    }
    else {
      unint64_t v10 = @"NO";
    }
    [v6 appendFormat:@"    privateListeningEnabled: %@\n", v10];
  }
  if (self->_SBEnabled) {
    int v11 = @"true";
  }
  else {
    int v11 = @"false";
  }
  [v6 appendFormat:@"    SBEnabled:%@\n", v11];
  siriInitiated = self->_siriInitiated;
  if (siriInitiated)
  {
    if ([(NSNumber *)siriInitiated BOOLValue]) {
      double v13 = @"YES";
    }
    else {
      double v13 = @"NO";
    }
    [v6 appendFormat:@"    siriInitiated: %@\n", v13];
  }
  objc_msgSend(v6, "appendFormat:", @"    sourceType:%td\n", self->_sourceType);
  objc_msgSend(v6, "appendFormat:", @"    storeAccountID:%llu\n", self->_storeAccountID);
  [v6 appendFormat:@"    storeFrontID:%@\n", self->_storeFrontID];
  if (self->_storeID) {
    [v6 appendFormat:@"    storeID:'%@'\n", self->_storeID];
  }
  if (self->_requestingBundleIdentifier) {
    [v6 appendFormat:@"    requestingBundleIdentifier:'%@'\n", self->_requestingBundleIdentifier];
  }
  if (self->_requestingBundleVersion) {
    [v6 appendFormat:@"    requestingBundleVersion:'%@'\n", self->_requestingBundleVersion];
  }
  NSUInteger v14 = [(NSData *)self->_timedMetadata length];
  if (v14) {
    objc_msgSend(v6, "appendFormat:", @"    timedMetadata(length):%td\n", v14);
  }
  if (self->_trackInfo) {
    [v6 appendString:@"    hasTrackInfo:true\n"];
  }
  buildFeatures = self->_buildFeatures;
  if (buildFeatures)
  {
    v16 = [(NSArray *)buildFeatures msv_compactDescription];
    [v6 appendFormat:@"    buildFeatures:[%@]\n", v16];
  }
  if (self->_autoPlayMode) {
    objc_msgSend(v6, "appendFormat:", @"    autoPlayMode:%td\n", self->_autoPlayMode);
  }
  if (self->_repeatPlayMode) {
    objc_msgSend(v6, "appendFormat:", @"    repeatPlayMode:%td\n", self->_repeatPlayMode);
  }
  if (self->_shufflePlayMode) {
    objc_msgSend(v6, "appendFormat:", @"    shufflePlayMode:%td\n", self->_shufflePlayMode);
  }
  if (self->_audioQualityPreference) {
    objc_msgSend(v6, "appendFormat:", @"    audioQualityPreference:%lu\n", self->_audioQualityPreference);
  }
  if (self->_playbackFormatPreference) {
    objc_msgSend(v6, "appendFormat:", @"    playbackFormatPreference:%lu\n", self->_playbackFormatPreference);
  }
  if (self->_targetedAudioQuality) {
    [v6 appendFormat:@"    targetedAudioQuality:%@\n", self->_targetedAudioQuality];
  }
  if (self->_providedAudioQuality) {
    [v6 appendFormat:@"    providedAudioQuality:%@\n", self->_providedAudioQuality];
  }
  if (self->_sharedActivityGroupSizeCurrent) {
    objc_msgSend(v6, "appendFormat:", @"    sharedActivityGroupSizeCurrent:%llu\n", self->_sharedActivityGroupSizeCurrent);
  }
  if (self->_sharedActivityGroupSizeMax) {
    objc_msgSend(v6, "appendFormat:", @"    sharedActivityGroupSizeMax:%llu\n", self->_sharedActivityGroupSizeMax);
  }
  if (self->_sharedActivityType) {
    objc_msgSend(v6, "appendFormat:", @"    sharedActivityType:%lu\n", self->_sharedActivityType);
  }
  if (self->_collaborativePlaylist) {
    [v6 appendFormat:@"    isCollaborativePlaylist:true\n"];
  }
  if (self->_vocalAttenuationAvailability) {
    objc_msgSend(v6, "appendFormat:", @"    vocalAttenuationAvailability:%lu\n", self->_vocalAttenuationAvailability);
  }
  if (self->_vocalAttenuationDuration != 0.0) {
    objc_msgSend(v6, "appendFormat:", @"    vocalAttenuationDuration:%f\n", *(void *)&self->_vocalAttenuationDuration);
  }
  [v6 appendString:@">"];
  id v17 = v6;

  return v17;
}

- (ICPlayActivityEvent)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  int64_t v5 = [[ICPAPlayActivityEvent alloc] initWithData:v4];
  if (v5)
  {
    BOOL v6 = [(ICPlayActivityEvent *)self init];

    if (v6)
    {
      $1C24819EE6FCB6BF7661081CD3A68180 has = v5->_has;
      if ((*(_DWORD *)&has & 0x400000) != 0)
      {
        uint64_t v8 = (v5->_audioQualityPreference - 1);
        if (v8 < 4) {
          unint64_t v9 = v8 + 1;
        }
        else {
          unint64_t v9 = 0;
        }
        v6->_unint64_t audioQualityPreference = v9;
        $1C24819EE6FCB6BF7661081CD3A68180 has = v5->_has;
      }
      id v134 = v4;
      if ((*(_DWORD *)&has & 0x20000000) != 0)
      {
        int playbackFormatPreference = v5->_playbackFormatPreference;
        BOOL v11 = playbackFormatPreference == 1;
        BOOL v12 = playbackFormatPreference == 2;
        uint64_t v13 = 2;
        if (!v12) {
          uint64_t v13 = v11;
        }
        v6->_int playbackFormatPreference = v13;
      }
      if (v5->_targetedAudioQuality)
      {
        NSUInteger v14 = objc_alloc_init(ICMutablePlayActivityAudioQualityProperties);
        int v15 = v5->_targetedAudioQuality;
        v16 = v15;
        if (v15)
        {
          [(ICMutablePlayActivityAudioQualityProperties *)v14 setBitRate:v15->_bitRate];
          [(ICMutablePlayActivityAudioQualityProperties *)v14 setBitDepth:v16->_bitDepth];
          channelLayoutDescription = v16->_channelLayoutDescription;
        }
        else
        {
          [(ICMutablePlayActivityAudioQualityProperties *)v14 setBitRate:0];
          [(ICMutablePlayActivityAudioQualityProperties *)v14 setBitDepth:0];
          channelLayoutDescription = 0;
        }
        double v18 = channelLayoutDescription;
        [(ICMutablePlayActivityAudioQualityProperties *)v14 setChannelLayoutDescription:v18];

        if (v16)
        {
          [(ICMutablePlayActivityAudioQualityProperties *)v14 setCodec:v16->_codec];
          [(ICMutablePlayActivityAudioQualityProperties *)v14 setSampleRate:v16->_sampleRate];
          BOOL isSpatialized = v16->_isSpatialized;
        }
        else
        {
          [(ICMutablePlayActivityAudioQualityProperties *)v14 setCodec:0];
          [(ICMutablePlayActivityAudioQualityProperties *)v14 setSampleRate:0];
          BOOL isSpatialized = 0;
        }
        -[ICMutablePlayActivityAudioQualityProperties setSpatialized:](v14, "setSpatialized:", isSpatialized, v4);
        objc_storeStrong((id *)&v6->_targetedAudioQuality, v14);
      }
      if (v5->_providedAudioQuality)
      {
        double v20 = objc_alloc_init(ICMutablePlayActivityAudioQualityProperties);
        int v21 = v5->_providedAudioQuality;
        int v22 = v21;
        if (v21)
        {
          [(ICMutablePlayActivityAudioQualityProperties *)v20 setBitRate:v21->_bitRate];
          [(ICMutablePlayActivityAudioQualityProperties *)v20 setBitDepth:v22->_bitDepth];
          BOOL v23 = v22->_channelLayoutDescription;
        }
        else
        {
          [(ICMutablePlayActivityAudioQualityProperties *)v20 setBitRate:0];
          [(ICMutablePlayActivityAudioQualityProperties *)v20 setBitDepth:0];
          BOOL v23 = 0;
        }
        unint64_t v24 = v23;
        [(ICMutablePlayActivityAudioQualityProperties *)v20 setChannelLayoutDescription:v24];

        if (v22)
        {
          [(ICMutablePlayActivityAudioQualityProperties *)v20 setCodec:v22->_codec];
          [(ICMutablePlayActivityAudioQualityProperties *)v20 setSampleRate:v22->_sampleRate];
          BOOL v25 = v22->_isSpatialized;
        }
        else
        {
          [(ICMutablePlayActivityAudioQualityProperties *)v20 setCodec:0];
          [(ICMutablePlayActivityAudioQualityProperties *)v20 setSampleRate:0];
          BOOL v25 = 0;
        }
        -[ICMutablePlayActivityAudioQualityProperties setSpatialized:](v20, "setSpatialized:", v25, v134);
        objc_storeStrong((id *)&v6->_providedAudioQuality, v20);
      }
      $1C24819EE6FCB6BF7661081CD3A68180 v26 = v5->_has;
      if ((*(_DWORD *)&v26 & 0x800000) != 0)
      {
        unsigned int v27 = v5->_containerType - 1;
        if (v27 > 3) {
          unint64_t v28 = 0;
        }
        else {
          unint64_t v28 = qword_1A3032C98[v27];
        }
        v6->_unint64_t containerType = v28;
        $1C24819EE6FCB6BF7661081CD3A68180 v26 = v5->_has;
      }
      if ((*(void *)&v26 & 0x800000000) != 0) {
        v6->_int continuityCameraUsed = v5->_continuityCameraUsed;
      }
      deviceName = v5->_deviceName;
      if (deviceName) {
        objc_storeStrong((id *)&v6->_deviceName, deviceName);
      }
      $1C24819EE6FCB6BF7661081CD3A68180 v30 = v5->_has;
      if ((*(_DWORD *)&v30 & 0x1000000) != 0)
      {
        uint64_t v31 = (v5->_displayType - 1);
        if (v31 < 3) {
          unint64_t v32 = v31 + 1;
        }
        else {
          unint64_t v32 = 0;
        }
        v6->_unint64_t displayType = v32;
        $1C24819EE6FCB6BF7661081CD3A68180 v30 = v5->_has;
        if ((*(_DWORD *)&v30 & 0x2000000) == 0)
        {
LABEL_36:
          if ((*(unsigned char *)&v30 & 0x10) == 0) {
            goto LABEL_48;
          }
LABEL_46:
          if (fabs(v5->_eventDateTimestamp) > 2.22044605e-16)
          {
            uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
            eventDate = v6->_eventDate;
            v6->_eventDate = (NSDate *)v35;
          }
LABEL_48:
          eventTimeZoneName = v5->_eventTimeZoneName;
          if (eventTimeZoneName)
          {
            int v38 = eventTimeZoneName;
            uint64_t v39 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v38];
            eventTimeZone = v6->_eventTimeZone;
            v6->_eventTimeZone = (NSTimeZone *)v39;
          }
          else
          {
            if ((*(unsigned char *)&v5->_has & 0x20) == 0
              || (double eventSecondsFromGMT = v5->_eventSecondsFromGMT, fabs(eventSecondsFromGMT) <= 2.22044605e-16))
            {
LABEL_54:
              featureName = v5->_featureName;
              if (featureName) {
                objc_storeStrong((id *)&v6->_featureName, featureName);
              }
              $1C24819EE6FCB6BF7661081CD3A68180 v44 = v5->_has;
              if ((*(unsigned char *)&v44 & 0x80) != 0)
              {
                v6->_double itemDuration = v5->_itemDuration;
                $1C24819EE6FCB6BF7661081CD3A68180 v44 = v5->_has;
                if ((*(_WORD *)&v44 & 0x100) == 0)
                {
LABEL_58:
                  if ((*(_WORD *)&v44 & 0x200) == 0) {
                    goto LABEL_59;
                  }
                  goto LABEL_101;
                }
              }
              else if ((*(_WORD *)&v44 & 0x100) == 0)
              {
                goto LABEL_58;
              }
              v6->_double itemEndTime = v5->_itemEndTime;
              $1C24819EE6FCB6BF7661081CD3A68180 v44 = v5->_has;
              if ((*(_WORD *)&v44 & 0x200) == 0)
              {
LABEL_59:
                if ((*(_DWORD *)&v44 & 0x8000000) == 0) {
                  goto LABEL_60;
                }
                goto LABEL_102;
              }
LABEL_101:
              v6->_double itemStartTime = v5->_itemStartTime;
              $1C24819EE6FCB6BF7661081CD3A68180 v44 = v5->_has;
              if ((*(_DWORD *)&v44 & 0x8000000) == 0)
              {
LABEL_60:
                if ((*(unsigned char *)&v44 & 1) == 0) {
                  goto LABEL_62;
                }
                goto LABEL_61;
              }
LABEL_102:
              uint64_t v63 = (v5->_itemType - 1);
              if (v63 < 9) {
                unint64_t v64 = v63 + 1;
              }
              else {
                unint64_t v64 = 0;
              }
              v6->_unint64_t itemType = v64;
              if ((*(void *)&v5->_has & 1) == 0)
              {
LABEL_62:
                lyricLanguage = v5->_lyricLanguage;
                if (lyricLanguage) {
                  objc_storeStrong((id *)&v6->_lyricsLanguage, lyricLanguage);
                }
                $1C24819EE6FCB6BF7661081CD3A68180 v46 = v5->_has;
                if ((*(_DWORD *)&v46 & 0x10000000) != 0)
                {
                  v6->_unint64_t mediaType = v5->_mediaType == 1;
                  $1C24819EE6FCB6BF7661081CD3A68180 v46 = v5->_has;
                  if ((*(void *)&v46 & 0x4000000000) == 0)
                  {
LABEL_66:
                    if ((*(_WORD *)&v46 & 0x400) == 0) {
                      goto LABEL_68;
                    }
                    goto LABEL_67;
                  }
                }
                else if ((*(void *)&v46 & 0x4000000000) == 0)
                {
                  goto LABEL_66;
                }
                v6->_int offline = v5->_offline;
                if ((*(void *)&v5->_has & 0x400) == 0)
                {
LABEL_68:
                  queueGroupingID = v5->_queueGroupingID;
                  if (queueGroupingID) {
                    objc_storeStrong((id *)&v6->_queueGroupingID, queueGroupingID);
                  }
                  recommendationData = v5->_recommendationData;
                  if (recommendationData) {
                    objc_storeStrong((id *)&v6->_recommendationData, recommendationData);
                  }
                  $1C24819EE6FCB6BF7661081CD3A68180 v49 = v5->_has;
                  if ((*(void *)&v49 & 0x10000000000) != 0)
                  {
                    v6->_int SBEnabled = v5->_sBEnabled;
                    $1C24819EE6FCB6BF7661081CD3A68180 v49 = v5->_has;
                    if ((*(void *)&v49 & 0x100000000) == 0)
                    {
LABEL_74:
                      if ((*(_DWORD *)&v49 & 0x20000) == 0) {
                        goto LABEL_76;
                      }
                      goto LABEL_75;
                    }
                  }
                  else if ((*(void *)&v49 & 0x100000000) == 0)
                  {
                    goto LABEL_74;
                  }
                  int sourceType = v5->_sourceType;
                  BOOL v66 = sourceType == 1;
                  BOOL v12 = sourceType == 2;
                  uint64_t v67 = 2;
                  if (!v12) {
                    uint64_t v67 = v66;
                  }
                  v6->_int sourceType = v67;
                  if ((*(void *)&v5->_has & 0x20000) == 0)
                  {
LABEL_76:
                    storeFrontID = v5->_storeFrontID;
                    if (storeFrontID) {
                      objc_storeStrong((id *)&v6->_storeFrontID, storeFrontID);
                    }
                    timedMetadata = v5->_timedMetadata;
                    if (timedMetadata) {
                      objc_storeStrong((id *)&v6->_timedMetadata, timedMetadata);
                    }
                    trackInfo = v5->_trackInfo;
                    if (trackInfo) {
                      objc_storeStrong((id *)&v6->_trackInfo, trackInfo);
                    }
                    $1C24819EE6FCB6BF7661081CD3A68180 v53 = v5->_has;
                    if ((*(_DWORD *)&v53 & 0x4000000) != 0)
                    {
                      int eventType = v5->_eventType;
                      BOOL v55 = eventType == 2;
                      BOOL v12 = eventType == 3;
                      uint64_t v56 = 2;
                      if (!v12) {
                        uint64_t v56 = v55;
                      }
                      v6->_int eventType = v56;
                      $1C24819EE6FCB6BF7661081CD3A68180 v53 = v5->_has;
                    }
                    if ((*(_DWORD *)&v53 & 0x40000000) != 0) {
                      v6->_unint64_t reasonHintType = v5->_reasonHintType == 1;
                    }
                    if ([(NSMutableArray *)v5->_buildFeatures count]) {
                      objc_storeStrong((id *)&v6->_buildFeatures, v5->_buildFeatures);
                    }
                    buildVersion = v5->_buildVersion;
                    if (buildVersion) {
                      objc_storeStrong((id *)&v6->_buildVersion, buildVersion);
                    }
                    requestingBundleVersion = v5->_requestingBundleVersion;
                    if (requestingBundleVersion) {
                      objc_storeStrong((id *)&v6->_requestingBundleVersion, requestingBundleVersion);
                    }
                    requestingBundleIdentifier = v5->_requestingBundleIdentifier;
                    if (requestingBundleIdentifier) {
                      objc_storeStrong((id *)&v6->_requestingBundleIdentifier, requestingBundleIdentifier);
                    }
                    playMode = v5->_playMode;
                    if (playMode)
                    {
                      int v61 = playMode;
                      if (*(unsigned char *)&v61->_has) {
                        int autoPlayMode = v61->_autoPlayMode;
                      }
                      else {
                        int autoPlayMode = 0;
                      }
                      uint64_t v68 = (autoPlayMode - 1);
                      if (v68 < 3) {
                        unint64_t v69 = v68 + 1;
                      }
                      else {
                        unint64_t v69 = 0;
                      }
                      v6->_int autoPlayMode = v69;
                      if ((*(unsigned char *)&v61->_has & 2) != 0) {
                        int repeatPlayMode = v61->_repeatPlayMode;
                      }
                      else {
                        int repeatPlayMode = 0;
                      }
                      uint64_t v71 = 0;
                      uint64_t v72 = (repeatPlayMode - 1);
                      if (v72 < 3) {
                        unint64_t v73 = v72 + 1;
                      }
                      else {
                        unint64_t v73 = 0;
                      }
                      v6->_int repeatPlayMode = v73;
                      if ((*(unsigned char *)&v61->_has & 4) != 0)
                      {
                        int shufflePlayMode = v61->_shufflePlayMode;
                        uint64_t v71 = shufflePlayMode == 1;
                        if (shufflePlayMode == 2) {
                          uint64_t v71 = 2;
                        }
                      }
                      v6->_int shufflePlayMode = v71;
                    }
                    $1C24819EE6FCB6BF7661081CD3A68180 v75 = v5->_has;
                    if ((*(void *)&v75 & 0x200000000) != 0)
                    {
                      uint64_t v77 = (v5->_systemReleaseType - 1);
                      if (v77 >= 4) {
                        uint64_t v76 = 0;
                      }
                      else {
                        uint64_t v76 = v77 + 1;
                      }
                    }
                    else
                    {
                      if ((*(void *)&v75 & 0x1000000000) == 0) {
                        goto LABEL_136;
                      }
                      uint64_t v76 = 4 * v5->_internalBuild;
                    }
                    v6->_int64_t systemReleaseType = v76;
LABEL_136:
                    enqueuerProperties = v5->_enqueuerProperties;
                    if (!enqueuerProperties) {
                      goto LABEL_154;
                    }
                    int v79 = enqueuerProperties;
                    v80 = objc_alloc_init(ICMutablePlayActivityEnqueuerProperties);
                    uint64_t v81 = v79->_buildVersion;
                    if (v81)
                    {
                      int v82 = v81;
                      [(ICMutablePlayActivityEnqueuerProperties *)v80 setBuildVersion:v82];
                    }
                    deviceGUID = v79->_deviceGUID;
                    if (deviceGUID)
                    {
                      int v84 = deviceGUID;
                      [(ICMutablePlayActivityEnqueuerProperties *)v80 setDeviceGUID:v84];
                    }
                    v85 = v79->_deviceName;
                    if (v85)
                    {
                      v86 = v85;
                      [(ICMutablePlayActivityEnqueuerProperties *)v80 setDeviceName:v86];
                    }
                    timeZoneName = v79->_timeZoneName;
                    if (timeZoneName)
                    {
                      v88 = timeZoneName;
                      char v89 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v88];
                      [(ICMutablePlayActivityEnqueuerProperties *)v80 setTimeZone:v89];
                    }
                    char v90 = (char)v79->_has;
                    if ((v90 & 2) != 0)
                    {
                      uint64_t v109 = (v79->_systemReleaseType - 1);
                      if (v109 < 4) {
                        uint64_t v110 = v109 + 1;
                      }
                      else {
                        uint64_t v110 = 0;
                      }
                      [(ICMutablePlayActivityEnqueuerProperties *)v80 setSystemReleaseType:v110];
                      char v90 = (char)v79->_has;
                      if ((v90 & 8) == 0)
                      {
LABEL_147:
                        if ((v90 & 1) == 0)
                        {
LABEL_149:
                          v91 = v79->_storeFrontID;
                          if (v91)
                          {
                            int v92 = v91;
                            [(ICMutablePlayActivityEnqueuerProperties *)v80 setStoreFrontID:v92];
                          }
                          if ((*(unsigned char *)&v79->_has & 4) != 0)
                          {
                            v93 = [NSNumber numberWithBool:v79->_privateListeningEnabled];
                            [(ICMutablePlayActivityEnqueuerProperties *)v80 setPrivateListeningEnabled:v93];
                          }
                          uint64_t v94 = [(ICMutablePlayActivityEnqueuerProperties *)v80 copy];
                          v95 = v6->_enqueuerProperties;
                          v6->_enqueuerProperties = (ICPlayActivityEnqueuerProperties *)v94;

LABEL_154:
                          householdID = v5->_householdID;
                          if (householdID) {
                            objc_storeStrong((id *)&v6->_householdID, householdID);
                          }
                          $1C24819EE6FCB6BF7661081CD3A68180 v97 = v5->_has;
                          if ((*(void *)&v97 & 0x8000000000) != 0)
                          {
                            uint64_t v103 = [NSNumber numberWithBool:v5->_privateListeningEnabled];
                            privateListeningEnabled = v6->_privateListeningEnabled;
                            v6->_privateListeningEnabled = (NSNumber *)v103;

                            $1C24819EE6FCB6BF7661081CD3A68180 v97 = v5->_has;
                            if ((*(void *)&v97 & 0x20000000000) == 0)
                            {
LABEL_158:
                              if ((*(_WORD *)&v97 & 0x4000) == 0) {
                                goto LABEL_159;
                              }
                              goto LABEL_175;
                            }
                          }
                          else if ((*(void *)&v97 & 0x20000000000) == 0)
                          {
                            goto LABEL_158;
                          }
                          uint64_t v105 = [NSNumber numberWithBool:v5->_siriInitiated];
                          siriInitiated = v6->_siriInitiated;
                          v6->_siriInitiated = (NSNumber *)v105;

                          $1C24819EE6FCB6BF7661081CD3A68180 v97 = v5->_has;
                          if ((*(_WORD *)&v97 & 0x4000) == 0)
                          {
LABEL_159:
                            if ((*(_WORD *)&v97 & 0x8000) == 0) {
                              goto LABEL_160;
                            }
                            goto LABEL_176;
                          }
LABEL_175:
                          v6->_unint64_t sharedActivityGroupSizeCurrent = v5->_sharedActivityGroupSizeCurrent;
                          $1C24819EE6FCB6BF7661081CD3A68180 v97 = v5->_has;
                          if ((*(_WORD *)&v97 & 0x8000) == 0)
                          {
LABEL_160:
                            if ((*(_DWORD *)&v97 & 0x80000000) == 0) {
                              goto LABEL_161;
                            }
                            goto LABEL_177;
                          }
LABEL_176:
                          v6->_unint64_t sharedActivityGroupSizeMax = v5->_sharedActivityGroupSizeMax;
                          $1C24819EE6FCB6BF7661081CD3A68180 v97 = v5->_has;
                          if ((*(_DWORD *)&v97 & 0x80000000) == 0)
                          {
LABEL_161:
                            if ((*(void *)&v97 & 0x2000000000) == 0) {
                              goto LABEL_162;
                            }
                            goto LABEL_187;
                          }
LABEL_177:
                          unsigned int v107 = v5->_sharedActivityType - 1;
                          if (v107 > 5) {
                            int64_t v108 = 0;
                          }
                          else {
                            int64_t v108 = qword_1A3032D30[v107];
                          }
                          v6->_int64_t sharedActivityType = v108;
                          $1C24819EE6FCB6BF7661081CD3A68180 v97 = v5->_has;
                          if ((*(void *)&v97 & 0x2000000000) == 0)
                          {
LABEL_162:
                            if ((*(void *)&v97 & 0x400000000) == 0) {
                              goto LABEL_163;
                            }
                            goto LABEL_188;
                          }
LABEL_187:
                          v6->_int collaborativePlaylist = v5->_isCollaborativePlaylist;
                          $1C24819EE6FCB6BF7661081CD3A68180 v97 = v5->_has;
                          if ((*(void *)&v97 & 0x400000000) == 0)
                          {
LABEL_163:
                            if ((*(_DWORD *)&v97 & 0x200000) == 0) {
                              goto LABEL_165;
                            }
                            goto LABEL_164;
                          }
LABEL_188:
                          int vocalAttenuationAvailibility = v5->_vocalAttenuationAvailibility;
                          BOOL v112 = vocalAttenuationAvailibility == 1;
                          BOOL v12 = vocalAttenuationAvailibility == 2;
                          uint64_t v113 = 2;
                          if (!v12) {
                            uint64_t v113 = v112;
                          }
                          v6->_unint64_t vocalAttenuationAvailability = v113;
                          if ((*(void *)&v5->_has & 0x200000) == 0)
                          {
LABEL_165:
                            if (v6->_version <= 1)
                            {
                              containerID = v5->_containerID;
                              BOOL v99 = containerID != 0;
                              if (containerID) {
                                objc_storeStrong((id *)&v6->_containerID, containerID);
                              }
                              externalID = v5->_externalID;
                              if (externalID)
                              {
                                objc_storeStrong((id *)&v6->_externalID, externalID);
                                BOOL v99 = 1;
                              }
                              personalizedContainerID = v5->_personalizedContainerID;
                              if (personalizedContainerID)
                              {
                                objc_storeStrong((id *)&v6->_personalizedContainerID, personalizedContainerID);
                                storeID = v5->_storeID;
                                if (!storeID) {
                                  goto LABEL_227;
                                }
                                goto LABEL_193;
                              }
                              storeID = v5->_storeID;
                              if (storeID)
                              {
LABEL_193:
                                objc_storeStrong((id *)&v6->_storeID, storeID);
LABEL_227:
                                id v4 = v135;
                                goto LABEL_228;
                              }
                              if (v99 || v6->_version < 2) {
                                goto LABEL_227;
                              }
                            }
                            uint64_t v144 = 0;
                            v145 = &v144;
                            uint64_t v146 = 0x3032000000;
                            v147 = __Block_byref_object_copy__21292;
                            v148 = __Block_byref_object_dispose__21293;
                            id v149 = 0;
                            v143[0] = MEMORY[0x1E4F143A8];
                            v143[1] = 3221225472;
                            v143[2] = __50__ICPlayActivityEvent_initWithDataRepresentation___block_invoke;
                            v143[3] = &unk_1E5ACD4F0;
                            v143[4] = &v144;
                            uint64_t v114 = MEMORY[0x1A6240BF0](v143);
                            v115 = (void (**)(void))v114;
                            if ((*(unsigned char *)&v5->_has & 4) != 0)
                            {
                              (*(void (**)(uint64_t))(v114 + 16))(v114);
                              [(id)v145[5] setAdamID:v5->_containerAdamID];
                            }
                            if (v5->_globalPlaylistID)
                            {
                              v115[2](v115);
                              v116 = (void *)v145[5];
                              v117 = v5->_globalPlaylistID;
                              [v116 setGlobalPlaylistID:v117];
                            }
                            if (v5->_playlistVersionHash)
                            {
                              v115[2](v115);
                              v118 = (void *)v145[5];
                              uint64_t v119 = v5->_playlistVersionHash;
                              [v118 setPlaylistVersionHash:v119];
                            }
                            if (v5->_stationHash)
                            {
                              v115[2](v115);
                              v120 = (void *)v145[5];
                              uint64_t v121 = v5->_stationHash;
                              [v120 setStationHash:v121];
                            }
                            if (v5->_stationStringID)
                            {
                              v115[2](v115);
                              v122 = (void *)v145[5];
                              uint64_t v123 = v5->_stationStringID;
                              [v122 setStationStringID:v123];
                            }
                            if (*((unsigned char *)&v5->_has + 2))
                            {
                              v115[2](v115);
                              [(id)v145[5] setStationID:v5->_stationID];
                            }
                            if (v5->_cloudAlbumID)
                            {
                              v115[2](v115);
                              uint64_t v124 = (void *)v145[5];
                              uint64_t v125 = v5->_cloudAlbumID;
                              [v124 setCloudAlbumID:v125];
                            }
                            if ((*(unsigned char *)&v5->_has & 2) != 0)
                            {
                              v115[2](v115);
                              [(id)v145[5] setCloudPlaylistID:v5->_cloudPlaylistID];
                            }
                            objc_storeStrong((id *)&v6->_containerIDs, (id)v145[5]);
                            uint64_t v137 = 0;
                            v138 = &v137;
                            uint64_t v139 = 0x3032000000;
                            v140 = __Block_byref_object_copy__21292;
                            v141 = __Block_byref_object_dispose__21293;
                            id v142 = 0;
                            v136[0] = MEMORY[0x1E4F143A8];
                            v136[1] = 3221225472;
                            v136[2] = __50__ICPlayActivityEvent_initWithDataRepresentation___block_invoke_2;
                            v136[3] = &unk_1E5ACD4F0;
                            v136[4] = &v137;
                            uint64_t v126 = MEMORY[0x1A6240BF0](v136);
                            v127 = (void (**)(void))v126;
                            $1C24819EE6FCB6BF7661081CD3A68180 v128 = v5->_has;
                            if ((*(_DWORD *)&v128 & 0x40000) != 0)
                            {
                              (*(void (**)(uint64_t))(v126 + 16))(v126);
                              [(id)v138[5] setSubscriptionAdamID:v5->_subscriptionAdamID];
                              $1C24819EE6FCB6BF7661081CD3A68180 v128 = v5->_has;
                            }
                            if ((*(_WORD *)&v128 & 0x800) != 0)
                            {
                              v127[2](v127);
                              [(id)v138[5] setPurchasedAdamID:v5->_purchasedAdamID];
                              $1C24819EE6FCB6BF7661081CD3A68180 v128 = v5->_has;
                            }
                            if ((*(_WORD *)&v128 & 0x1000) != 0)
                            {
                              v127[2](v127);
                              [(id)v138[5] setRadioAdamID:v5->_radioAdamID];
                              $1C24819EE6FCB6BF7661081CD3A68180 v128 = v5->_has;
                            }
                            if ((*(unsigned char *)&v128 & 0x40) != 0)
                            {
                              v127[2](v127);
                              [(id)v138[5] setCloudID:v5->_itemCloudID];
                            }
                            if (v5->_lyricsID)
                            {
                              v127[2](v127);
                              uint64_t v129 = (void *)v138[5];
                              v130 = v5->_lyricsID;
                              [v129 setLyricsID:v130];
                            }
                            $1C24819EE6FCB6BF7661081CD3A68180 v131 = v5->_has;
                            if ((*(unsigned char *)&v131 & 8) != 0)
                            {
                              v127[2](v127);
                              [(id)v138[5] setEquivalencySourceAdamID:v5->_equivalencySourceAdamID];
                              $1C24819EE6FCB6BF7661081CD3A68180 v131 = v5->_has;
                            }
                            if ((*(_WORD *)&v131 & 0x2000) != 0)
                            {
                              v127[2](v127);
                              [(id)v138[5] setReportingAdamID:v5->_reportingAdamID];
                            }
                            objc_storeStrong((id *)&v6->_itemIDs, (id)v138[5]);

                            _Block_object_dispose(&v137, 8);
                            _Block_object_dispose(&v144, 8);

                            goto LABEL_227;
                          }
LABEL_164:
                          v6->_double vocalAttenuationDuration = v5->_vocalAttenuationDuration;
                          goto LABEL_165;
                        }
LABEL_148:
                        [(ICMutablePlayActivityEnqueuerProperties *)v80 setStoreAccountID:v79->_storeAccountID];
                        goto LABEL_149;
                      }
                    }
                    else if ((*(unsigned char *)&v79->_has & 8) == 0)
                    {
                      goto LABEL_147;
                    }
                    [(ICMutablePlayActivityEnqueuerProperties *)v80 setSBEnabled:v79->_sBEnabled];
                    if ((*(unsigned char *)&v79->_has & 1) == 0) {
                      goto LABEL_149;
                    }
                    goto LABEL_148;
                  }
LABEL_75:
                  v6->_unint64_t storeAccountID = v5->_storeAccountID;
                  goto LABEL_76;
                }
LABEL_67:
                v6->_int64_t persistentID = v5->_persistentID;
                goto LABEL_68;
              }
LABEL_61:
              v6->_unint64_t lyricsDisplayedCharacterCount = v5->_characterDisplayedCount;
              goto LABEL_62;
            }
            uint64_t v42 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:(uint64_t)eventSecondsFromGMT];
            int v38 = v6->_eventTimeZone;
            v6->_eventTimeZone = (NSTimeZone *)v42;
          }

          goto LABEL_54;
        }
      }
      else if ((*(_DWORD *)&v30 & 0x2000000) == 0)
      {
        goto LABEL_36;
      }
      unsigned int v33 = v5->_endReasonType - 1;
      if (v33 > 0xE) {
        unint64_t v34 = 0;
      }
      else {
        unint64_t v34 = qword_1A3032CB8[v33];
      }
      v6->_unint64_t endReasonType = v34;
      if ((*(void *)&v5->_has & 0x10) == 0) {
        goto LABEL_48;
      }
      goto LABEL_46;
    }
  }
  else
  {

    BOOL v6 = 0;
  }
LABEL_228:
  v132 = v6;

  return v132;
}

uint64_t __50__ICPlayActivityEvent_initWithDataRepresentation___block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    uint64_t v1 = result;
    v2 = objc_alloc_init(ICMutablePlayActivityEventContainerIDs);
    uint64_t v3 = *(void *)(*(void *)(v1 + 32) + 8);
    uint64_t v4 = *(void *)(v3 + 40);
    *(void *)(v3 + 40) = v2;
    return MEMORY[0x1F41817F8](v2, v4);
  }
  return result;
}

uint64_t __50__ICPlayActivityEvent_initWithDataRepresentation___block_invoke_2(uint64_t result)
{
  if (!*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    uint64_t v1 = result;
    v2 = objc_alloc_init(ICMutablePlayActivityEventItemIDs);
    uint64_t v3 = *(void *)(*(void *)(v1 + 32) + 8);
    uint64_t v4 = *(void *)(v3 + 40);
    *(void *)(v3 + 40) = v2;
    return MEMORY[0x1F41817F8](v2, v4);
  }
  return result;
}

- (ICPlayActivityEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICPlayActivityEvent;
  result = [(ICPlayActivityEvent *)&v3 init];
  if (result)
  {
    result->_int eventType = 0;
    result->_version = 2;
  }
  return result;
}

@end