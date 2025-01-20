@interface SSVPlayActivityEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternalBuild;
- (BOOL)isOffline;
- (BOOL)isSBEnabled;
- (Class)_mutableCopyClass;
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
- (NSString)requestingBundleIdentifier;
- (NSString)requestingBundleVersion;
- (NSString)storeFrontID;
- (NSString)storeID;
- (NSTimeZone)eventTimeZone;
- (SSVPlayActivityEnqueuerProperties)enqueuerProperties;
- (SSVPlayActivityEvent)init;
- (SSVPlayActivityEvent)initWithCoder:(id)a3;
- (SSVPlayActivityEvent)initWithDataRepresentation:(id)a3;
- (SSVPlayActivityEventContainerIDs)containerIDs;
- (SSVPlayActivityEventItemIDs)itemIDs;
- (double)itemDuration;
- (double)itemEndTime;
- (double)itemStartTime;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)persistentID;
- (int64_t)systemReleaseType;
- (int64_t)version;
- (unint64_t)containerType;
- (unint64_t)displayType;
- (unint64_t)endReasonType;
- (unint64_t)eventType;
- (unint64_t)itemType;
- (unint64_t)lyricsDisplayedCharacterCount;
- (unint64_t)mediaType;
- (unint64_t)reasonHintType;
- (unint64_t)sourceType;
- (unint64_t)storeAccountID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SSVPlayActivityEvent

- (SSVPlayActivityEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)SSVPlayActivityEvent;
  result = [(SSVPlayActivityEvent *)&v3 init];
  if (result)
  {
    result->_eventType = 0;
    result->_version = 1;
  }
  return result;
}

- (SSVPlayActivityEvent)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [[SSVPBPlayActivityEvent alloc] initWithData:v4];
  if (!v5)
  {

    v6 = 0;
    goto LABEL_172;
  }
  v6 = [(SSVPlayActivityEvent *)self init];

  if (v6)
  {
    if ([(SSVPBPlayActivityEvent *)v5 hasContainerType])
    {
      unsigned int v7 = [(SSVPBPlayActivityEvent *)v5 containerType] - 1;
      if (v7 > 3) {
        unint64_t v8 = 0;
      }
      else {
        unint64_t v8 = qword_1A52F65B0[v7];
      }
      v6->_containerType = v8;
    }
    if ([(SSVPBPlayActivityEvent *)v5 hasDeviceName])
    {
      uint64_t v9 = [(SSVPBPlayActivityEvent *)v5 deviceName];
      deviceName = v6->_deviceName;
      v6->_deviceName = (NSString *)v9;
    }
    if ([(SSVPBPlayActivityEvent *)v5 hasDisplayType])
    {
      uint64_t v11 = [(SSVPBPlayActivityEvent *)v5 displayType] - 1;
      if (v11 < 3) {
        unint64_t v12 = v11 + 1;
      }
      else {
        unint64_t v12 = 0;
      }
      v6->_displayType = v12;
    }
    if ([(SSVPBPlayActivityEvent *)v5 hasEndReasonType])
    {
      unsigned int v13 = [(SSVPBPlayActivityEvent *)v5 endReasonType] - 1;
      if (v13 > 0xD) {
        unint64_t v14 = 0;
      }
      else {
        unint64_t v14 = qword_1A52F65D0[v13];
      }
      v6->_endReasonType = v14;
    }
    if ([(SSVPBPlayActivityEvent *)v5 hasEventDateTimestamp])
    {
      [(SSVPBPlayActivityEvent *)v5 eventDateTimestamp];
      if (fabs(v15) > 2.22044605e-16)
      {
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
        eventDate = v6->_eventDate;
        v6->_eventDate = (NSDate *)v16;
      }
    }
    if ([(SSVPBPlayActivityEvent *)v5 hasEventTimeZoneName])
    {
      v18 = [(SSVPBPlayActivityEvent *)v5 eventTimeZoneName];
      if (v18)
      {
        uint64_t v19 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v18];
        eventTimeZone = v6->_eventTimeZone;
        v6->_eventTimeZone = (NSTimeZone *)v19;
      }
    }
    else
    {
      if (![(SSVPBPlayActivityEvent *)v5 hasEventSecondsFromGMT]
        || ([(SSVPBPlayActivityEvent *)v5 eventSecondsFromGMT], fabs(v21) <= 2.22044605e-16))
      {
LABEL_31:
        if ([(SSVPBPlayActivityEvent *)v5 hasFeatureName])
        {
          uint64_t v23 = [(SSVPBPlayActivityEvent *)v5 featureName];
          featureName = v6->_featureName;
          v6->_featureName = (NSString *)v23;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasItemDuration])
        {
          [(SSVPBPlayActivityEvent *)v5 itemDuration];
          v6->_itemDuration = v25;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasItemEndTime])
        {
          [(SSVPBPlayActivityEvent *)v5 itemEndTime];
          v6->_itemEndTime = v26;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasItemStartTime])
        {
          [(SSVPBPlayActivityEvent *)v5 itemStartTime];
          v6->_itemStartTime = v27;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasItemType])
        {
          uint64_t v28 = [(SSVPBPlayActivityEvent *)v5 itemType] - 1;
          if (v28 < 9) {
            unint64_t v29 = v28 + 1;
          }
          else {
            unint64_t v29 = 0;
          }
          v6->_itemType = v29;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasCharacterDisplayedCount]) {
          v6->_lyricsDisplayedCharacterCount = [(SSVPBPlayActivityEvent *)v5 characterDisplayedCount];
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasLyricLanguage])
        {
          uint64_t v30 = [(SSVPBPlayActivityEvent *)v5 lyricLanguage];
          lyricsLanguage = v6->_lyricsLanguage;
          v6->_lyricsLanguage = (NSString *)v30;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasMediaType]) {
          v6->_mediaType = [(SSVPBPlayActivityEvent *)v5 mediaType] == 1;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasOffline]) {
          v6->_offline = [(SSVPBPlayActivityEvent *)v5 offline];
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasPersistentID]) {
          v6->_persistentID = [(SSVPBPlayActivityEvent *)v5 persistentID];
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasRecommendationData])
        {
          uint64_t v32 = [(SSVPBPlayActivityEvent *)v5 recommendationData];
          recommendationData = v6->_recommendationData;
          v6->_recommendationData = (NSData *)v32;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasSBEnabled]) {
          v6->_SBEnabled = [(SSVPBPlayActivityEvent *)v5 sBEnabled];
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasSourceType])
        {
          int v34 = [(SSVPBPlayActivityEvent *)v5 sourceType];
          uint64_t v35 = v34 == 1;
          if (v34 == 2) {
            uint64_t v35 = 2;
          }
          v6->_sourceType = v35;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasStoreAccountID]) {
          v6->_storeAccountID = [(SSVPBPlayActivityEvent *)v5 storeAccountID];
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasStoreFrontID])
        {
          uint64_t v36 = [(SSVPBPlayActivityEvent *)v5 storeFrontID];
          storeFrontID = v6->_storeFrontID;
          v6->_storeFrontID = (NSString *)v36;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasTimedMetadata])
        {
          uint64_t v38 = [(SSVPBPlayActivityEvent *)v5 timedMetadata];
          timedMetadata = v6->_timedMetadata;
          v6->_timedMetadata = (NSData *)v38;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasTrackInfo])
        {
          uint64_t v40 = [(SSVPBPlayActivityEvent *)v5 trackInfo];
          trackInfo = v6->_trackInfo;
          v6->_trackInfo = (NSData *)v40;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasEventType])
        {
          int v42 = [(SSVPBPlayActivityEvent *)v5 eventType];
          uint64_t v43 = v42 == 2;
          if (v42 == 3) {
            uint64_t v43 = 2;
          }
          v6->_eventType = v43;
          uint64_t version = v6->_version;
          if (version <= 2) {
            uint64_t version = 2;
          }
          v6->_uint64_t version = version;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasReasonHintType])
        {
          v6->_reasonHintType = [(SSVPBPlayActivityEvent *)v5 reasonHintType] == 1;
          uint64_t v45 = v6->_version;
          if (v45 <= 2) {
            uint64_t v45 = 2;
          }
          v6->_uint64_t version = v45;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasBuildVersion])
        {
          uint64_t v46 = [(SSVPBPlayActivityEvent *)v5 buildVersion];
          buildVersion = v6->_buildVersion;
          v6->_buildVersion = (NSString *)v46;

          uint64_t v48 = v6->_version;
          if (v48 <= 2) {
            uint64_t v48 = 2;
          }
          v6->_uint64_t version = v48;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasRequestingBundleVersion])
        {
          uint64_t v49 = [(SSVPBPlayActivityEvent *)v5 requestingBundleVersion];
          requestingBundleVersion = v6->_requestingBundleVersion;
          v6->_requestingBundleVersion = (NSString *)v49;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasRequestingBundleIdentifier])
        {
          uint64_t v51 = [(SSVPBPlayActivityEvent *)v5 requestingBundleIdentifier];
          requestingBundleIdentifier = v6->_requestingBundleIdentifier;
          v6->_requestingBundleIdentifier = (NSString *)v51;
        }
        if ([(SSVPBPlayActivityEvent *)v5 hasSystemReleaseType])
        {
          uint64_t v53 = [(SSVPBPlayActivityEvent *)v5 systemReleaseType] - 1;
          if (v53 >= 4) {
            uint64_t v54 = 0;
          }
          else {
            uint64_t v54 = v53 + 1;
          }
        }
        else
        {
          if (![(SSVPBPlayActivityEvent *)v5 hasInternalBuild])
          {
LABEL_97:
            if ([(SSVPBPlayActivityEvent *)v5 hasEnqueuerProperties])
            {
              v56 = [(SSVPBPlayActivityEvent *)v5 enqueuerProperties];
              if (v56)
              {
                v57 = objc_alloc_init(SSVMutablePlayActivityEnqueuerProperties);
                if ([v56 hasBuildVersion])
                {
                  v58 = [v56 buildVersion];
                  [(SSVMutablePlayActivityEnqueuerProperties *)v57 setBuildVersion:v58];
                }
                if ([v56 hasDeviceGUID])
                {
                  v59 = [v56 deviceGUID];
                  [(SSVMutablePlayActivityEnqueuerProperties *)v57 setDeviceGUID:v59];
                }
                if ([v56 hasDeviceName])
                {
                  v60 = [v56 deviceName];
                  [(SSVMutablePlayActivityEnqueuerProperties *)v57 setDeviceName:v60];
                }
                if ([v56 hasTimeZoneName])
                {
                  v61 = [v56 timeZoneName];
                  if (v61)
                  {
                    v62 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v61];
                    [(SSVMutablePlayActivityEnqueuerProperties *)v57 setTimeZone:v62];
                  }
                }
                if ([v56 hasSystemReleaseType])
                {
                  uint64_t v63 = [v56 systemReleaseType] - 1;
                  if (v63 < 4) {
                    uint64_t v64 = v63 + 1;
                  }
                  else {
                    uint64_t v64 = 0;
                  }
                  [(SSVMutablePlayActivityEnqueuerProperties *)v57 setSystemReleaseType:v64];
                }
                if ([v56 hasSBEnabled]) {
                  -[SSVMutablePlayActivityEnqueuerProperties setSBEnabled:](v57, "setSBEnabled:", [v56 sBEnabled]);
                }
                if ([v56 hasStoreAccountID]) {
                  -[SSVMutablePlayActivityEnqueuerProperties setStoreAccountID:](v57, "setStoreAccountID:", [v56 storeAccountID]);
                }
                if ([v56 hasStoreFrontID])
                {
                  v65 = [v56 storeFrontID];
                  [(SSVMutablePlayActivityEnqueuerProperties *)v57 setStoreFrontID:v65];
                }
                if ([v56 hasPrivateListeningEnabled])
                {
                  v66 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v56, "privateListeningEnabled"));
                  [(SSVMutablePlayActivityEnqueuerProperties *)v57 setPrivateListeningEnabled:v66];
                }
                uint64_t v67 = [(SSVMutablePlayActivityEnqueuerProperties *)v57 copy];
                enqueuerProperties = v6->_enqueuerProperties;
                v6->_enqueuerProperties = (SSVPlayActivityEnqueuerProperties *)v67;
              }
            }
            if ([(SSVPBPlayActivityEvent *)v5 hasHouseholdID])
            {
              uint64_t v69 = [(SSVPBPlayActivityEvent *)v5 householdID];
              householdID = v6->_householdID;
              v6->_householdID = (NSString *)v69;
            }
            if ([(SSVPBPlayActivityEvent *)v5 hasPrivateListeningEnabled])
            {
              uint64_t v71 = objc_msgSend(NSNumber, "numberWithBool:", -[SSVPBPlayActivityEvent privateListeningEnabled](v5, "privateListeningEnabled"));
              privateListeningEnabled = v6->_privateListeningEnabled;
              v6->_privateListeningEnabled = (NSNumber *)v71;
            }
            if ([(SSVPBPlayActivityEvent *)v5 hasSiriInitiated])
            {
              uint64_t v73 = objc_msgSend(NSNumber, "numberWithBool:", -[SSVPBPlayActivityEvent siriInitiated](v5, "siriInitiated"));
              siriInitiated = v6->_siriInitiated;
              v6->_siriInitiated = (NSNumber *)v73;
            }
            if (v6->_version > 1) {
              goto LABEL_142;
            }
            BOOL v75 = [(SSVPBPlayActivityEvent *)v5 hasContainerID];
            char v76 = v75;
            if (v75)
            {
              uint64_t v77 = [(SSVPBPlayActivityEvent *)v5 containerID];
              containerID = v6->_containerID;
              v6->_containerID = (NSString *)v77;
            }
            if ([(SSVPBPlayActivityEvent *)v5 hasExternalID])
            {
              uint64_t v79 = [(SSVPBPlayActivityEvent *)v5 externalID];
              externalID = v6->_externalID;
              v6->_externalID = (NSString *)v79;

              char v76 = 1;
            }
            if ([(SSVPBPlayActivityEvent *)v5 hasPersonalizedContainerID])
            {
              uint64_t v81 = [(SSVPBPlayActivityEvent *)v5 personalizedContainerID];
              personalizedContainerID = v6->_personalizedContainerID;
              v6->_personalizedContainerID = (NSString *)v81;

              if (![(SSVPBPlayActivityEvent *)v5 hasStoreID]) {
                goto LABEL_172;
              }
              goto LABEL_139;
            }
            if ([(SSVPBPlayActivityEvent *)v5 hasStoreID])
            {
LABEL_139:
              uint64_t v83 = [(SSVPBPlayActivityEvent *)v5 storeID];
              storeID = v6->_storeID;
              v6->_storeID = (NSString *)v83;
LABEL_171:

              goto LABEL_172;
            }
            if ((v76 & 1) == 0 && v6->_version >= 2)
            {
LABEL_142:
              uint64_t v109 = 0;
              v110 = &v109;
              uint64_t v111 = 0x3032000000;
              v112 = __Block_byref_object_copy__59;
              v113 = __Block_byref_object_dispose__59;
              v114 = 0;
              v108[0] = MEMORY[0x1E4F143A8];
              v108[1] = 3221225472;
              v108[2] = __51__SSVPlayActivityEvent_initWithDataRepresentation___block_invoke;
              v108[3] = &unk_1E5BA7298;
              v108[4] = &v109;
              v85 = (void (**)(void))MEMORY[0x1A6268200](v108);
              if ([(SSVPBPlayActivityEvent *)v5 hasContainerAdamID])
              {
                v85[2](v85);
                objc_msgSend((id)v110[5], "setAdamID:", -[SSVPBPlayActivityEvent containerAdamID](v5, "containerAdamID"));
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasGlobalPlaylistID])
              {
                v85[2](v85);
                v86 = (void *)v110[5];
                v87 = [(SSVPBPlayActivityEvent *)v5 globalPlaylistID];
                [v86 setGlobalPlaylistID:v87];
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasPlaylistVersionHash])
              {
                v85[2](v85);
                v88 = (void *)v110[5];
                v89 = [(SSVPBPlayActivityEvent *)v5 playlistVersionHash];
                [v88 setPlaylistVersionHash:v89];
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasStationHash])
              {
                v85[2](v85);
                v90 = (void *)v110[5];
                v91 = [(SSVPBPlayActivityEvent *)v5 stationHash];
                [v90 setStationHash:v91];
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasStationStringID])
              {
                v85[2](v85);
                v92 = (void *)v110[5];
                v93 = [(SSVPBPlayActivityEvent *)v5 stationStringID];
                [v92 setStationStringID:v93];
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasStationID])
              {
                v85[2](v85);
                objc_msgSend((id)v110[5], "setStationID:", -[SSVPBPlayActivityEvent stationID](v5, "stationID"));
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasCloudAlbumID])
              {
                v85[2](v85);
                v94 = (void *)v110[5];
                v95 = [(SSVPBPlayActivityEvent *)v5 cloudAlbumID];
                [v94 setCloudAlbumID:v95];
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasCloudPlaylistID])
              {
                v85[2](v85);
                objc_msgSend((id)v110[5], "setCloudPlaylistID:", -[SSVPBPlayActivityEvent cloudPlaylistID](v5, "cloudPlaylistID"));
              }
              objc_storeStrong((id *)&v6->_containerIDs, (id)v110[5]);
              uint64_t v102 = 0;
              v103 = &v102;
              uint64_t v104 = 0x3032000000;
              v105 = __Block_byref_object_copy__59;
              v106 = __Block_byref_object_dispose__59;
              id v107 = 0;
              v101[0] = MEMORY[0x1E4F143A8];
              v101[1] = 3221225472;
              v101[2] = __51__SSVPlayActivityEvent_initWithDataRepresentation___block_invoke_2;
              v101[3] = &unk_1E5BA7298;
              v101[4] = &v102;
              v96 = (void (**)(void))MEMORY[0x1A6268200](v101);
              if ([(SSVPBPlayActivityEvent *)v5 hasSubscriptionAdamID])
              {
                v96[2](v96);
                objc_msgSend((id)v103[5], "setSubscriptionAdamID:", -[SSVPBPlayActivityEvent subscriptionAdamID](v5, "subscriptionAdamID"));
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasPurchasedAdamID])
              {
                v96[2](v96);
                objc_msgSend((id)v103[5], "setPurchasedAdamID:", -[SSVPBPlayActivityEvent purchasedAdamID](v5, "purchasedAdamID"));
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasRadioAdamID])
              {
                v96[2](v96);
                objc_msgSend((id)v103[5], "setRadioAdamID:", -[SSVPBPlayActivityEvent radioAdamID](v5, "radioAdamID"));
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasItemCloudID])
              {
                v96[2](v96);
                objc_msgSend((id)v103[5], "setCloudID:", -[SSVPBPlayActivityEvent itemCloudID](v5, "itemCloudID"));
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasLyricsID])
              {
                v96[2](v96);
                v97 = (void *)v103[5];
                v98 = [(SSVPBPlayActivityEvent *)v5 lyricsID];
                [v97 setLyricsID:v98];
              }
              if ([(SSVPBPlayActivityEvent *)v5 hasEquivalencySourceAdamID])
              {
                v96[2](v96);
                objc_msgSend((id)v103[5], "setEquivalencySourceAdamID:", -[SSVPBPlayActivityEvent equivalencySourceAdamID](v5, "equivalencySourceAdamID"));
              }
              objc_storeStrong((id *)&v6->_itemIDs, (id)v103[5]);

              _Block_object_dispose(&v102, 8);
              _Block_object_dispose(&v109, 8);
              storeID = v114;
              goto LABEL_171;
            }
            goto LABEL_172;
          }
          BOOL v55 = [(SSVPBPlayActivityEvent *)v5 internalBuild];
          uint64_t v54 = 4;
          if (!v55) {
            uint64_t v54 = 0;
          }
        }
        v6->_systemReleaseType = v54;
        goto LABEL_97;
      }
      uint64_t v22 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:(uint64_t)v21];
      v18 = v6->_eventTimeZone;
      v6->_eventTimeZone = (NSTimeZone *)v22;
    }

    goto LABEL_31;
  }
LABEL_172:
  v99 = v6;

  return v99;
}

void __51__SSVPlayActivityEvent_initWithDataRepresentation___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    v2 = objc_alloc_init(SSVMutablePlayActivityEventContainerIDs);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

void __51__SSVPlayActivityEvent_initWithDataRepresentation___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    v2 = objc_alloc_init(SSVMutablePlayActivityEventItemIDs);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p persistentID:%llu", v5, self, -[SSVPlayActivityEvent persistentID](self, "persistentID")];

  if (self->_containerID) {
    [v6 appendFormat:@" containerID:'%@'", self->_containerID];
  }
  if (self->_containerIDs) {
    [v6 appendFormat:@" containerIDs:'%@'", self->_containerIDs];
  }
  if (self->_containerType) {
    objc_msgSend(v6, "appendFormat:", @" containerType:%td", self->_containerType);
  }
  if (self->_deviceName) {
    [v6 appendFormat:@" deviceName:'%@'", self->_deviceName];
  }
  objc_msgSend(v6, "appendFormat:", @" endReasonType:%td", self->_endReasonType);
  if (self->_enqueuerProperties) {
    [v6 appendFormat:@" enqueuerProperties:'%@'", self->_enqueuerProperties];
  }
  if (self->_eventDate) {
    [v6 appendFormat:@" eventDate:%@", self->_eventDate];
  }
  if (self->_eventTimeZone) {
    [v6 appendFormat:@" eventTimeZone:%@", self->_eventTimeZone];
  }
  if (self->_externalID) {
    [v6 appendFormat:@" externalID:'%@'", self->_externalID];
  }
  if (self->_featureName) {
    [v6 appendFormat:@" featureName:'%@'", self->_featureName];
  }
  if (self->_householdID) {
    [v6 appendFormat:@" householdID:'%@'", self->_householdID];
  }
  if (self->_systemReleaseType) {
    objc_msgSend(v6, "appendFormat:", @" systemReleaseType: %li", self->_systemReleaseType);
  }
  objc_msgSend(v6, "appendFormat:", @" itemDuration:%f itemStartTime:%f itemEndTime:%f", *(void *)&self->_itemDuration, *(void *)&self->_itemStartTime, *(void *)&self->_itemEndTime);
  if (self->_itemType) {
    objc_msgSend(v6, "appendFormat:", @" itemType:%td", self->_itemType);
  }
  if (self->_itemIDs) {
    [v6 appendFormat:@" itemIDs:'%@'", self->_itemIDs];
  }
  objc_msgSend(v6, "appendFormat:", @" mediaType:%td", self->_mediaType);
  if (self->_offline) {
    unsigned int v7 = @"true";
  }
  else {
    unsigned int v7 = @"false";
  }
  [v6 appendFormat:@" offline:%@", v7];
  if (self->_personalizedContainerID) {
    [v6 appendFormat:@" personalizedContainerID:'%@'", self->_personalizedContainerID];
  }
  if (self->_recommendationData) {
    [v6 appendFormat:@" hasRecommendationData:true"];
  }
  privateListeningEnabled = self->_privateListeningEnabled;
  if (privateListeningEnabled)
  {
    if ([(NSNumber *)privateListeningEnabled BOOLValue]) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    [v6 appendFormat:@" privateListeningEnabled: %@", v9];
  }
  if (self->_SBEnabled) {
    v10 = @"true";
  }
  else {
    v10 = @"false";
  }
  [v6 appendFormat:@" SBEnabled:%@", v10];
  siriInitiated = self->_siriInitiated;
  if (siriInitiated)
  {
    if ([(NSNumber *)siriInitiated BOOLValue]) {
      unint64_t v12 = @"YES";
    }
    else {
      unint64_t v12 = @"NO";
    }
    [v6 appendFormat:@" siriInitiated: %@", v12];
  }
  objc_msgSend(v6, "appendFormat:", @" sourceType:%td", self->_sourceType);
  objc_msgSend(v6, "appendFormat:", @" storeAccountID:%llu", self->_storeAccountID);
  [v6 appendFormat:@" storeFrontID:%@", self->_storeFrontID];
  if (self->_storeID) {
    [v6 appendFormat:@" storeID:'%@'", self->_storeID];
  }
  if (self->_requestingBundleIdentifier) {
    [v6 appendFormat:@" requestingBundleIdentifier:'%@'", self->_requestingBundleIdentifier];
  }
  if (self->_requestingBundleVersion) {
    [v6 appendFormat:@" requestingBundleVersion:'%@'", self->_requestingBundleVersion];
  }
  NSUInteger v13 = [(NSData *)self->_timedMetadata length];
  if (v13) {
    objc_msgSend(v6, "appendFormat:", @" timedMetadata(length):%td", v13);
  }
  if (self->_trackInfo) {
    [v6 appendString:@" hasTrackInfo:true"];
  }
  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SSVPlayActivityEvent *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(SSVPlayActivityEvent *)self persistentID];
      BOOL v6 = v5 == [(SSVPlayActivityEvent *)v4 persistentID];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (SSVPlayActivityEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_SSVPlayActivityEventCoderDataRepresentation"];

  BOOL v6 = [(SSVPlayActivityEvent *)self initWithDataRepresentation:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(SSVPlayActivityEvent *)self dataRepresentation];
  if ([v4 length]) {
    [v5 encodeObject:v4 forKey:@"_SSVPlayActivityEventCoderDataRepresentation"];
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = [(SSVPlayActivityEvent *)self _mutableCopyClass];
  uint64_t v6 = [[(objc_class *)v5 allocWithZone:a3] init];

  if (v6)
  {
    objc_storeStrong((id *)(v6 + 8), self->_buildVersion);
    objc_storeStrong((id *)(v6 + 16), self->_containerID);
    objc_storeStrong((id *)(v6 + 24), self->_containerIDs);
    *(void *)(v6 + 32) = self->_containerType;
    objc_storeStrong((id *)(v6 + 40), self->_deviceName);
    *(void *)(v6 + 48) = self->_displayType;
    *(void *)(v6 + 56) = self->_endReasonType;
    objc_storeStrong((id *)(v6 + 64), self->_enqueuerProperties);
    objc_storeStrong((id *)(v6 + 72), self->_eventDate);
    objc_storeStrong((id *)(v6 + 80), self->_eventTimeZone);
    *(void *)(v6 + 88) = self->_eventType;
    objc_storeStrong((id *)(v6 + 96), self->_externalID);
    objc_storeStrong((id *)(v6 + 112), self->_householdID);
    objc_storeStrong((id *)(v6 + 104), self->_featureName);
    objc_storeStrong((id *)(v6 + 120), self->_itemIDs);
    *(double *)(v6 + 128) = self->_itemDuration;
    *(double *)(v6 + 136) = self->_itemEndTime;
    *(double *)(v6 + 144) = self->_itemStartTime;
    *(void *)(v6 + 152) = self->_itemType;
    *(void *)(v6 + 160) = self->_lyricsDisplayedCharacterCount;
    objc_storeStrong((id *)(v6 + 168), self->_lyricsLanguage);
    *(void *)(v6 + 176) = self->_mediaType;
    *(unsigned char *)(v6 + 184) = self->_offline;
    *(void *)(v6 + 192) = self->_persistentID;
    objc_storeStrong((id *)(v6 + 200), self->_personalizedContainerID);
    objc_storeStrong((id *)(v6 + 208), self->_privateListeningEnabled);
    *(void *)(v6 + 216) = self->_reasonHintType;
    objc_storeStrong((id *)(v6 + 224), self->_recommendationData);
    objc_storeStrong((id *)(v6 + 232), self->_requestingBundleIdentifier);
    objc_storeStrong((id *)(v6 + 240), self->_requestingBundleVersion);
    *(unsigned char *)(v6 + 248) = self->_SBEnabled;
    objc_storeStrong((id *)(v6 + 256), self->_siriInitiated);
    *(void *)(v6 + 264) = self->_sourceType;
    *(void *)(v6 + 280) = self->_storeAccountID;
    objc_storeStrong((id *)(v6 + 288), self->_storeFrontID);
    objc_storeStrong((id *)(v6 + 296), self->_storeID);
    *(void *)(v6 + 272) = self->_systemReleaseType;
    objc_storeStrong((id *)(v6 + 304), self->_timedMetadata);
    objc_storeStrong((id *)(v6 + 312), self->_trackInfo);
    *(void *)(v6 + 320) = self->_version;
  }
  return (id)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)dataRepresentation
{
  uint64_t v3 = objc_alloc_init(SSVPBPlayActivityEvent);
  unint64_t v4 = [(SSVPlayActivityEvent *)self containerType] - 1;
  if (v4 > 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = dword_1A52F6680[v4];
  }
  [(SSVPBPlayActivityEvent *)v3 setContainerType:v5];
  uint64_t v6 = [(SSVPlayActivityEvent *)self deviceName];
  [(SSVPBPlayActivityEvent *)v3 setDeviceName:v6];

  unint64_t v7 = [(SSVPlayActivityEvent *)self displayType] - 1;
  if (v7 < 3) {
    uint64_t v8 = (v7 + 1);
  }
  else {
    uint64_t v8 = 0;
  }
  [(SSVPBPlayActivityEvent *)v3 setDisplayType:v8];
  unint64_t v9 = [(SSVPlayActivityEvent *)self endReasonType];
  uint64_t v10 = 0;
  if (v9 - 1 <= 0xD) {
    uint64_t v10 = dword_1A52F6640[v9 - 1];
  }
  [(SSVPBPlayActivityEvent *)v3 setEndReasonType:v10];
  uint64_t v11 = [(SSVPlayActivityEvent *)self eventDate];
  [v11 timeIntervalSinceReferenceDate];
  -[SSVPBPlayActivityEvent setEventDateTimestamp:](v3, "setEventDateTimestamp:");

  unint64_t v12 = [(SSVPlayActivityEvent *)self eventTimeZone];
  NSUInteger v13 = [v12 name];
  [(SSVPBPlayActivityEvent *)v3 setEventTimeZoneName:v13];

  unint64_t v14 = [(SSVPlayActivityEvent *)self featureName];
  [(SSVPBPlayActivityEvent *)v3 setFeatureName:v14];

  [(SSVPlayActivityEvent *)self itemDuration];
  -[SSVPBPlayActivityEvent setItemDuration:](v3, "setItemDuration:");
  [(SSVPlayActivityEvent *)self itemEndTime];
  -[SSVPBPlayActivityEvent setItemEndTime:](v3, "setItemEndTime:");
  [(SSVPlayActivityEvent *)self itemStartTime];
  -[SSVPBPlayActivityEvent setItemStartTime:](v3, "setItemStartTime:");
  unint64_t v15 = [(SSVPlayActivityEvent *)self itemType] - 1;
  if (v15 < 9) {
    uint64_t v16 = (v15 + 1);
  }
  else {
    uint64_t v16 = 0;
  }
  [(SSVPBPlayActivityEvent *)v3 setItemType:v16];
  [(SSVPBPlayActivityEvent *)v3 setMediaType:[(SSVPlayActivityEvent *)self mediaType] == 1];
  [(SSVPBPlayActivityEvent *)v3 setCharacterDisplayedCount:[(SSVPlayActivityEvent *)self lyricsDisplayedCharacterCount]];
  v17 = [(SSVPlayActivityEvent *)self lyricsLanguage];
  [(SSVPBPlayActivityEvent *)v3 setLyricLanguage:v17];

  [(SSVPBPlayActivityEvent *)v3 setOffline:[(SSVPlayActivityEvent *)self isOffline]];
  [(SSVPBPlayActivityEvent *)v3 setPersistentID:[(SSVPlayActivityEvent *)self persistentID]];
  v18 = [(SSVPlayActivityEvent *)self recommendationData];
  [(SSVPBPlayActivityEvent *)v3 setRecommendationData:v18];

  [(SSVPBPlayActivityEvent *)v3 setSBEnabled:self->_SBEnabled];
  unint64_t v19 = [(SSVPlayActivityEvent *)self sourceType];
  if (v19 == 2) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = v19 == 1;
  }
  [(SSVPBPlayActivityEvent *)v3 setSourceType:v20];
  [(SSVPBPlayActivityEvent *)v3 setStoreAccountID:[(SSVPlayActivityEvent *)self storeAccountID]];
  double v21 = [(SSVPlayActivityEvent *)self storeFrontID];
  [(SSVPBPlayActivityEvent *)v3 setStoreFrontID:v21];

  uint64_t v22 = [(SSVPlayActivityEvent *)self timedMetadata];
  [(SSVPBPlayActivityEvent *)v3 setTimedMetadata:v22];

  uint64_t v23 = [(SSVPlayActivityEvent *)self trackInfo];
  [(SSVPBPlayActivityEvent *)v3 setTrackInfo:v23];

  v24 = [(SSVPlayActivityEvent *)self requestingBundleIdentifier];
  [(SSVPBPlayActivityEvent *)v3 setRequestingBundleIdentifier:v24];

  double v25 = [(SSVPlayActivityEvent *)self requestingBundleVersion];
  [(SSVPBPlayActivityEvent *)v3 setRequestingBundleVersion:v25];

  unint64_t v26 = [(SSVPlayActivityEvent *)self systemReleaseType] - 1;
  if (v26 < 4) {
    uint64_t v27 = (v26 + 1);
  }
  else {
    uint64_t v27 = 0;
  }
  [(SSVPBPlayActivityEvent *)v3 setSystemReleaseType:v27];
  uint64_t v28 = [(SSVPlayActivityEvent *)self enqueuerProperties];
  if (v28)
  {
    unint64_t v29 = objc_alloc_init(SSVPBPlayActivityEnqueuerProperties);
    uint64_t v30 = [v28 buildVersion];
    if (v30) {
      [(SSVPBPlayActivityEnqueuerProperties *)v29 setBuildVersion:v30];
    }
    v31 = [v28 deviceGUID];
    if (v31) {
      [(SSVPBPlayActivityEnqueuerProperties *)v29 setDeviceGUID:v31];
    }
    uint64_t v32 = [v28 deviceName];
    if (v32) {
      [(SSVPBPlayActivityEnqueuerProperties *)v29 setDeviceName:v32];
    }
    v33 = [v28 isPrivateListeningEnabled];
    int v34 = v33;
    if (v33) {
      -[SSVPBPlayActivityEnqueuerProperties setPrivateListeningEnabled:](v29, "setPrivateListeningEnabled:", [v33 BOOLValue]);
    }
    uint64_t v35 = [v28 timeZone];
    uint64_t v36 = v35;
    if (v35)
    {
      v37 = [v35 name];
      [(SSVPBPlayActivityEnqueuerProperties *)v29 setTimeZoneName:v37];
    }
    unint64_t v38 = [v28 systemReleaseType] - 1;
    if (v38 < 4) {
      uint64_t v39 = (v38 + 1);
    }
    else {
      uint64_t v39 = 0;
    }
    [(SSVPBPlayActivityEnqueuerProperties *)v29 setSystemReleaseType:v39];
    -[SSVPBPlayActivityEnqueuerProperties setSBEnabled:](v29, "setSBEnabled:", [v28 isSBEnabled]);
    uint64_t v40 = [v28 storeAccountID];
    if (v40) {
      [(SSVPBPlayActivityEnqueuerProperties *)v29 setStoreAccountID:v40];
    }
    v41 = [v28 storeFrontID];
    if (v41) {
      [(SSVPBPlayActivityEnqueuerProperties *)v29 setStoreFrontID:v41];
    }
    [(SSVPBPlayActivityEvent *)v3 setEnqueuerProperties:v29];
  }
  int v42 = [(SSVPlayActivityEvent *)self householdID];
  [(SSVPBPlayActivityEvent *)v3 setHouseholdID:v42];

  uint64_t v43 = [(SSVPlayActivityEvent *)self isPrivateListeningEnabled];
  v44 = v43;
  if (v43) {
    -[SSVPBPlayActivityEvent setPrivateListeningEnabled:](v3, "setPrivateListeningEnabled:", [v43 BOOLValue]);
  }
  uint64_t v45 = [(SSVPlayActivityEvent *)self isSiriInitiated];
  uint64_t v46 = v45;
  if (v45) {
    -[SSVPBPlayActivityEvent setSiriInitiated:](v3, "setSiriInitiated:", [v45 BOOLValue]);
  }
  if (self->_version > 1)
  {
    uint64_t v51 = [(SSVPlayActivityEvent *)self buildVersion];
    [(SSVPBPlayActivityEvent *)v3 setBuildVersion:v51];

    unint64_t v52 = [(SSVPlayActivityEvent *)self eventType];
    if (v52 == 1) {
      unsigned int v53 = 2;
    }
    else {
      unsigned int v53 = 1;
    }
    if (v52 == 2) {
      uint64_t v54 = 3;
    }
    else {
      uint64_t v54 = v53;
    }
    [(SSVPBPlayActivityEvent *)v3 setEventType:v54];
    [(SSVPBPlayActivityEvent *)v3 setReasonHintType:[(SSVPlayActivityEvent *)self reasonHintType] == 1];
    v50 = [(SSVPlayActivityEvent *)self containerIDs];
    -[SSVPBPlayActivityEvent setContainerAdamID:](v3, "setContainerAdamID:", [v50 adamID]);
    BOOL v55 = [v50 globalPlaylistID];
    [(SSVPBPlayActivityEvent *)v3 setGlobalPlaylistID:v55];

    v56 = [v50 playlistVersionHash];
    [(SSVPBPlayActivityEvent *)v3 setPlaylistVersionHash:v56];

    v57 = [v50 stationHash];
    [(SSVPBPlayActivityEvent *)v3 setStationHash:v57];

    v58 = [v50 stationStringID];
    [(SSVPBPlayActivityEvent *)v3 setStationStringID:v58];

    -[SSVPBPlayActivityEvent setStationID:](v3, "setStationID:", [v50 stationID]);
    v59 = [v50 cloudAlbumID];
    [(SSVPBPlayActivityEvent *)v3 setCloudAlbumID:v59];

    -[SSVPBPlayActivityEvent setCloudPlaylistID:](v3, "setCloudPlaylistID:", [v50 cloudPlaylistID]);
    v60 = [(SSVPlayActivityEvent *)self itemIDs];
    -[SSVPBPlayActivityEvent setSubscriptionAdamID:](v3, "setSubscriptionAdamID:", [v60 subscriptionAdamID]);
    -[SSVPBPlayActivityEvent setPurchasedAdamID:](v3, "setPurchasedAdamID:", [v60 purchasedAdamID]);
    -[SSVPBPlayActivityEvent setRadioAdamID:](v3, "setRadioAdamID:", [v60 radioAdamID]);
    -[SSVPBPlayActivityEvent setItemCloudID:](v3, "setItemCloudID:", [v60 cloudID]);
    v61 = [v60 lyricsID];
    [(SSVPBPlayActivityEvent *)v3 setLyricsID:v61];

    -[SSVPBPlayActivityEvent setEquivalencySourceAdamID:](v3, "setEquivalencySourceAdamID:", [v60 equivalencySourceAdamID]);
  }
  else
  {
    v47 = [(SSVPlayActivityEvent *)self containerID];
    [(SSVPBPlayActivityEvent *)v3 setContainerID:v47];

    uint64_t v48 = [(SSVPlayActivityEvent *)self externalID];
    [(SSVPBPlayActivityEvent *)v3 setExternalID:v48];

    uint64_t v49 = [(SSVPlayActivityEvent *)self personalizedContainerID];
    [(SSVPBPlayActivityEvent *)v3 setPersonalizedContainerID:v49];

    v50 = [(SSVPlayActivityEvent *)self storeID];
    [(SSVPBPlayActivityEvent *)v3 setStoreID:v50];
  }

  v62 = [(SSVPBPlayActivityEvent *)v3 data];

  return (NSData *)v62;
}

- (BOOL)isInternalBuild
{
  return self->_systemReleaseType == 4;
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

- (Class)_mutableCopyClass
{
  return (Class)objc_claimAutoreleasedReturnValue();
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (SSVPlayActivityEventContainerIDs)containerIDs
{
  return self->_containerIDs;
}

- (unint64_t)containerType
{
  return self->_containerType;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (unint64_t)endReasonType
{
  return self->_endReasonType;
}

- (SSVPlayActivityEnqueuerProperties)enqueuerProperties
{
  return self->_enqueuerProperties;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSTimeZone)eventTimeZone
{
  return self->_eventTimeZone;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSString)householdID
{
  return self->_householdID;
}

- (SSVPlayActivityEventItemIDs)itemIDs
{
  return self->_itemIDs;
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

- (unint64_t)itemType
{
  return self->_itemType;
}

- (unint64_t)lyricsDisplayedCharacterCount
{
  return self->_lyricsDisplayedCharacterCount;
}

- (NSString)lyricsLanguage
{
  return self->_lyricsLanguage;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (BOOL)isOffline
{
  return self->_offline;
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (unint64_t)reasonHintType
{
  return self->_reasonHintType;
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (BOOL)isSBEnabled
{
  return self->_SBEnabled;
}

- (NSNumber)isSiriInitiated
{
  return self->_siriInitiated;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (int64_t)systemReleaseType
{
  return self->_systemReleaseType;
}

- (NSData)timedMetadata
{
  return self->_timedMetadata;
}

- (NSData)trackInfo
{
  return self->_trackInfo;
}

- (NSString)containerID
{
  return self->_containerID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)personalizedContainerID
{
  return self->_personalizedContainerID;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_timedMetadata, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_siriInitiated, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recommendationData, 0);
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
}

@end