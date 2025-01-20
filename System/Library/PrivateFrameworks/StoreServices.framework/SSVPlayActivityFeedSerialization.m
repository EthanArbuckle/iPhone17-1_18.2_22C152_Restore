@interface SSVPlayActivityFeedSerialization
+ (id)defaultOverrideHTTPHeaderFields;
- (NSString)currentStoreFrontID;
- (id)propertyListObjectWithPlayActivityEvent:(id)a3;
- (void)setCurrentStoreFrontID:(id)a3;
@end

@implementation SSVPlayActivityFeedSerialization

+ (id)defaultOverrideHTTPHeaderFields
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"X-Guid";
  v4[1] = @"User-Agent";
  v4[2] = @"X-Dsid";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)propertyListObjectWithPlayActivityEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v115 = [v4 eventType];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    v7 = [v5 enqueuerProperties];
    id v8 = v6;
    id v9 = v8;
    v118 = v7;
    if (v7)
    {
      v116 = self;
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v12 = [v7 isSBEnabled];
      v13 = [NSNumber numberWithBool:v12];
      [v11 setObject:v13 forKey:@"sb-enabled"];

      v14 = [v7 deviceName];
      if ([v14 length]) {
        [v11 setObject:v14 forKey:@"device-name"];
      }
      v113 = v14;
      id v119 = v10;
      v15 = [v7 storeFrontID];
      if ([v15 length]) {
        [v11 setObject:v15 forKey:@"store-front"];
      }
      v16 = [v7 timeZone];
      uint64_t v17 = [v16 secondsFromGMT];
      v18 = [NSNumber numberWithLongLong:v17];
      [v11 setObject:v18 forKey:@"utc-offset-in-seconds"];

      v19 = [v7 buildVersion];
      if ([v19 length]) {
        [v11 setObject:v19 forKey:@"build-version"];
      }
      v20 = [v7 deviceGUID];
      if ([v20 length]) {
        [v11 setObject:v20 forKey:@"guid"];
      }
      v21 = [v7 isPrivateListeningEnabled];
      if (v21) {
        [v11 setObject:v21 forKey:@"private-enabled"];
      }
      if ([v7 systemReleaseType] == 4) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKey:@"internal-build"];
      }
      uint64_t v22 = [v7 storeAccountID];
      v23 = [NSNumber numberWithUnsignedLongLong:v22];
      [v11 setObject:v23 forKey:@"dsid"];

      [v8 setObject:v11 forKey:@"enqueuer"];
      id v9 = v119;
      self = v116;
    }
    v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isSBEnabled"));
    [v9 setObject:v24 forKey:@"sb-enabled"];

    v25 = [v5 deviceName];
    if ([v25 length]) {
      [v9 setObject:v25 forKey:@"device-name"];
    }
    v26 = [v5 storeFrontID];
    if (!v26) {
      v26 = self->_currentStoreFrontID;
    }
    if ([(NSString *)v26 length]) {
      [v9 setObject:v26 forKey:@"store-front"];
    }
    v27 = [v5 eventTimeZone];
    v28 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v27, "secondsFromGMT"));
    [v9 setObject:v28 forKey:@"utc-offset-in-seconds"];

    v29 = [v5 buildVersion];
    if ([v29 length]) {
      [v9 setObject:v29 forKey:@"build-version"];
    }
    if ([v5 systemReleaseType] == 4) {
      [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"internal-build"];
    }
    v30 = [v5 isPrivateListeningEnabled];
    if (v30) {
      [v9 setObject:v30 forKey:@"private-enabled"];
    }

    if (v118 && v9 != v8) {
      [v8 setObject:v9 forKey:@"player"];
    }
    uint64_t v31 = [v5 containerType];
    uint64_t v107 = v31;
    if ((unint64_t)(v31 - 1) > 3) {
      uint64_t v32 = 0;
    }
    else {
      uint64_t v32 = qword_1A52F6418[v31 - 1];
    }
    v34 = [NSNumber numberWithInteger:v32];
    [v8 setObject:v34 forKey:@"container-type"];

    if (v115 == 1)
    {
LABEL_46:
      v43 = [v5 featureName];
      if ([v43 length]) {
        [v8 setObject:v43 forKey:@"feature-name"];
      }
      [v5 itemDuration];
      v45 = [NSNumber numberWithLongLong:(uint64_t)(v44 * 1000.0)];
      [v8 setObject:v45 forKey:@"media-duration-in-milliseconds"];

      v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "mediaType") == 1);
      [v8 setObject:v46 forKey:@"media-type"];

      v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isOffline"));
      [v8 setObject:v47 forKey:@"offline"];

      uint64_t v48 = [v5 persistentID];
      if (v48)
      {
        v49 = objc_msgSend(NSString, "stringWithFormat:", @"%lli", v48);
        [v8 setObject:v49 forKey:@"persistent-id"];
      }
      v50 = [v5 eventDate];
      v51 = v50;
      if (v50)
      {
        [v50 timeIntervalSinceNow];
        v53 = [NSNumber numberWithLongLong:(uint64_t)(v52 * -1000.0) & ~((uint64_t)(v52 * -1000.0) >> 63)];
        [v8 setObject:v53 forKey:@"milliseconds-since-play"];
      }
      uint64_t v54 = [v5 recommendationData];
      if (v54) {
        [v8 setObject:v54 forKey:@"reco-data"];
      }
      v114 = (void *)v54;
      uint64_t v55 = [v5 sourceType];
      if (v55 == 2) {
        uint64_t v56 = 7;
      }
      else {
        uint64_t v56 = v55 == 1;
      }
      v57 = [NSNumber numberWithInteger:v56];
      [v8 setObject:v57 forKey:@"source-type"];

      [v5 itemStartTime];
      v59 = [NSNumber numberWithLongLong:(uint64_t)(v58 * 1000.0)];
      [v8 setObject:v59 forKey:@"start-position-in-milliseconds"];

      v60 = [v5 timedMetadata];
      if ([v60 length]) {
        [v8 setObject:v60 forKey:@"timed-metadata"];
      }
      v117 = [v5 trackInfo];
      if ([v117 length])
      {
        v61 = [MEMORY[0x1E4F28F98] propertyListWithData:v117 options:0 format:0 error:0];
        if (v61) {
          [v8 setObject:v61 forKey:@"track-info"];
        }
      }
      v112 = v60;
      uint64_t v62 = [v5 itemType];
      if ((unint64_t)(v62 - 1) > 8) {
        uint64_t v63 = 0;
      }
      else {
        uint64_t v63 = qword_1A52F64A8[v62 - 1];
      }
      v64 = [NSNumber numberWithInteger:v63];
      [v8 setObject:v64 forKey:@"type"];

      uint64_t v65 = [v5 requestingBundleIdentifier];
      if (v65) {
        [v8 setObject:v65 forKey:@"bundle-id"];
      }
      v120 = v9;
      uint64_t v66 = [v5 requestingBundleVersion];
      if (v66) {
        [v8 setObject:v66 forKey:@"bundle-version"];
      }
      v67 = v43;
      v110 = (void *)v66;
      v68 = [v5 householdID];
      if ([v68 length]) {
        [v8 setObject:v68 forKey:@"household-id"];
      }
      uint64_t v69 = [v5 isSiriInitiated];
      if (v69) {
        [v8 setObject:v69 forKey:@"siri-initiated"];
      }
      v108 = (void *)v69;
      v111 = (void *)v65;
      v109 = v68;
      if ([v5 version] <= 1)
      {
        v70 = [v5 containerID];
        if (v70) {
          [v8 setObject:v70 forKey:@"container-id"];
        }
        v71 = [v5 externalID];
        if (v71) {
          [v8 setObject:v71 forKey:@"external-identifier"];
        }
        v72 = [v5 personalizedContainerID];
        if ([v72 length]) {
          [v8 setObject:v72 forKey:@"personalized-container-id"];
        }
        v73 = [v5 storeID];
        v74 = v67;
        if ([v73 length]) {
          [v8 setObject:v73 forKey:@"id"];
        }
        v75 = v120;
LABEL_132:

        if ([v8 count]) {
          v103 = v8;
        }
        else {
          v103 = 0;
        }
        id v33 = v103;

        goto LABEL_136;
      }
      v105 = v51;
      v106 = v67;
      v76 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "reasonHintType") == 1);
      [v8 setObject:v76 forKey:@"event-reason-hint-type"];

      if (v115 == 2) {
        uint64_t v77 = 2;
      }
      else {
        uint64_t v77 = v115 == 1;
      }
      v78 = [NSNumber numberWithInteger:v77];
      [v8 setObject:v78 forKey:@"event-type"];

      v70 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      v79 = [v5 itemIDs];
      v71 = v79;
      if (v107 == 1)
      {
        uint64_t v80 = [v79 radioAdamID];
        if (v80)
        {
          v81 = [NSNumber numberWithLongLong:v80];
          v82 = @"radio-adam-id";
LABEL_101:
          [v70 setObject:v81 forKey:v82];
        }
      }
      else
      {
        uint64_t v83 = [v79 subscriptionAdamID];
        uint64_t v84 = v83;
        if (v62 != 6)
        {
          if (v83)
          {
            v85 = [NSNumber numberWithLongLong:v83];
            [v70 setObject:v85 forKey:@"subscription-adam-id"];
          }
          uint64_t v86 = objc_msgSend(v71, "equivalencySourceAdamID", v84);
          if (v86)
          {
            v87 = [NSNumber numberWithLongLong:v86];
            [v70 setObject:v87 forKey:@"orig-sf-adam-id"];
          }
          uint64_t v88 = [v71 purchasedAdamID];
          if (v88)
          {
            v89 = [NSNumber numberWithLongLong:v88];
            [v70 setObject:v89 forKey:@"purchased-adam-id"];
          }
          uint64_t v90 = [v71 cloudID];
          if (!v90) {
            goto LABEL_102;
          }
          v81 = [NSNumber numberWithLongLong:v90];
          v82 = @"cloud-id";
          goto LABEL_101;
        }
        if (v83)
        {
          v81 = [NSNumber numberWithLongLong:v83];
          v82 = @"auc-adam-id";
          goto LABEL_101;
        }
      }
LABEL_102:
      v72 = [v71 lyricsID];
      if ([v72 length]) {
        [v70 setObject:v72 forKey:@"lyric-id"];
      }
      if ([v70 count]) {
        [v8 setObject:v70 forKey:@"ids"];
      }
      v73 = [v5 containerIDs];
      v91 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      v74 = v106;
      switch(v107)
      {
        case 1:
          v92 = [v73 stationHash];
          if ([v92 length]) {
            [v91 setObject:v92 forKey:@"station-hash"];
          }
          v93 = [v73 stationStringID];
          if ([v93 length]) {
            [v91 setObject:v93 forKey:@"station-id"];
          }
          uint64_t v94 = [v73 stationID];
          if (v94)
          {
            v95 = [NSNumber numberWithLongLong:v94];
            [v91 setObject:v95 forKey:@"station-personalized-id"];

            v74 = v106;
          }

          goto LABEL_128;
        case 2:
          v92 = [v73 globalPlaylistID];
          if ([v92 length]) {
            [v91 setObject:v92 forKey:@"global-playlist-id"];
          }
          v96 = [v73 playlistVersionHash];
          if ([v96 length]) {
            [v91 setObject:v96 forKey:@"playlist-version-hash"];
          }
          uint64_t v97 = [v73 cloudPlaylistID];
          if (v97)
          {
            v98 = [NSNumber numberWithLongLong:v97];
            [v91 setObject:v98 forKey:@"cloud-playlist-id"];
          }
          v74 = v106;
          goto LABEL_128;
        case 3:
          uint64_t v99 = [v73 adamID];
          if (!v99) {
            goto LABEL_129;
          }
          v92 = [NSNumber numberWithLongLong:v99];
          v100 = @"artist-adam-id";
          break;
        case 4:
          uint64_t v101 = [v73 adamID];
          if (v101)
          {
            v102 = [NSNumber numberWithLongLong:v101];
            [v91 setObject:v102 forKey:@"album-adam-id"];
          }
          v92 = [v73 cloudAlbumID];
          if (![v92 length]) {
            goto LABEL_128;
          }
          v100 = @"cloud-album-id";
          break;
        default:
          goto LABEL_129;
      }
      [v91 setObject:v92 forKey:v100];
LABEL_128:

LABEL_129:
      if ([v91 count]) {
        [v8 setObject:v91 forKey:@"container-ids"];
      }

      v75 = v120;
      v51 = v105;
      goto LABEL_132;
    }
    [v5 itemEndTime];
    v36 = [NSNumber numberWithLongLong:(uint64_t)(v35 * 1000.0)];
    [v8 setObject:v36 forKey:@"end-position-in-milliseconds"];

    if (v115 == 2)
    {
      v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "displayType"));
      [v8 setObject:v39 forKey:@"display-type"];

      v40 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "lyricsDisplayedCharacterCount"));
      [v8 setObject:v40 forKey:@"character-displayed-count"];

      v41 = [v5 lyricsLanguage];
      if (![v41 length])
      {
LABEL_45:

        goto LABEL_46;
      }
      v42 = @"lyric-language";
    }
    else
    {
      if (v115) {
        goto LABEL_46;
      }
      unint64_t v37 = [v5 endReasonType] - 1;
      if (v37 > 0xD) {
        uint64_t v38 = 0;
      }
      else {
        uint64_t v38 = qword_1A52F6438[v37];
      }
      v41 = [NSNumber numberWithInteger:v38];
      v42 = @"end-reason-type";
    }
    [v8 setObject:v41 forKey:v42];
    goto LABEL_45;
  }
  id v33 = 0;
LABEL_136:

  return v33;
}

- (NSString)currentStoreFrontID
{
  return self->_currentStoreFrontID;
}

- (void)setCurrentStoreFrontID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end