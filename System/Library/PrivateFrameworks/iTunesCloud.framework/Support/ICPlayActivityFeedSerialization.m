@interface ICPlayActivityFeedSerialization
+ (id)defaultOverrideHTTPHeaderFields;
- (NSString)currentStoreFrontID;
- (id)propertyListObjectWithPlayActivityEvent:(id)a3;
- (void)setCurrentStoreFrontID:(id)a3;
@end

@implementation ICPlayActivityFeedSerialization

+ (id)defaultOverrideHTTPHeaderFields
{
  v4[0] = ICStoreHTTPHeaderKeyXGUID;
  v4[1] = ICHTTPHeaderKeyUserAgent;
  v4[2] = ICStoreHTTPHeaderKeyXDSID;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

- (void).cxx_destruct
{
}

- (void)setCurrentStoreFrontID:(id)a3
{
}

- (NSString)currentStoreFrontID
{
  return self->_currentStoreFrontID;
}

- (id)propertyListObjectWithPlayActivityEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v63 = 0;
    goto LABEL_202;
  }
  v180 = self;
  id v179 = [v4 eventType];
  id v6 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:50];
  v7 = [v5 targetedAudioQuality];
  if (v7)
  {
    id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:6];
    v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 bitDepth]);
    [v8 setObject:v9 forKey:@"audio-bit-depth"];

    v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 bitRate]);
    [v8 setObject:v10 forKey:@"bit-rate-in-bps"];

    uint64_t v11 = [v7 channelLayoutDescription];
    v12 = (void *)v11;
    if (v11) {
      CFStringRef v13 = (const __CFString *)v11;
    }
    else {
      CFStringRef v13 = &stru_1001BF9F0;
    }
    [v8 setObject:v13 forKey:@"audio-channel-type"];
    uint64_t v14 = [v7 codecString];
    v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = &stru_1001BF9F0;
    }
    [v8 setObject:v16 forKey:@"codec"];
    v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 sampleRate]);
    [v8 setObject:v17 forKey:@"audio-sample-rate-in-hz"];

    if ([v7 isSpatialized]) {
      v18 = &off_1001CBFA8;
    }
    else {
      v18 = &off_1001CBFC0;
    }
    [v8 setObject:v18 forKey:@"playback-format"];
    [v6 setObject:v8 forKey:@"audio-quality-targeted"];
  }
  uint64_t v19 = [v5 providedAudioQuality];
  v184 = (void *)v19;
  if (v19)
  {
    v20 = (void *)v19;
    id v21 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:6];
    v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v20 bitDepth]);
    [v21 setObject:v22 forKey:@"audio-bit-depth"];

    v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v184 bitRate]);
    [v21 setObject:v23 forKey:@"bit-rate-in-bps"];

    uint64_t v24 = [v184 channelLayoutDescription];
    v25 = (void *)v24;
    if (v24) {
      CFStringRef v26 = (const __CFString *)v24;
    }
    else {
      CFStringRef v26 = &stru_1001BF9F0;
    }
    [v21 setObject:v26 forKey:@"audio-channel-type"];
    uint64_t v27 = [v184 codecString];
    v28 = (void *)v27;
    if (v27) {
      CFStringRef v29 = (const __CFString *)v27;
    }
    else {
      CFStringRef v29 = &stru_1001BF9F0;
    }
    [v21 setObject:v29 forKey:@"codec"];
    v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v184 sampleRate]);
    [v21 setObject:v30 forKey:@"audio-sample-rate-in-hz"];

    if ([v184 isSpatialized]) {
      v31 = &off_1001CBFA8;
    }
    else {
      v31 = &off_1001CBFC0;
    }
    [v21 setObject:v31 forKey:@"playback-format"];
    [v6 setObject:v21 forKey:@"audio-quality-provided"];
  }
  id v32 = [v5 audioQualityPreference];
  if (v32)
  {
    if ((unint64_t)v32 >= 5) {
      id v33 = 0;
    }
    else {
      id v33 = v32;
    }
    v34 = +[NSNumber numberWithInteger:v33];
    [v6 setObject:v34 forKey:@"user-preference-audio-quality"];
  }
  id v35 = [v5 playbackFormatPreference];
  if (v35)
  {
    if (v35 == (id)2) {
      uint64_t v36 = 2;
    }
    else {
      uint64_t v36 = v35 == (id)1;
    }
    v37 = +[NSNumber numberWithInteger:v36];
    [v6 setObject:v37 forKey:@"user-preference-playback-format"];
  }
  id v38 = objc_alloc((Class)NSMutableArray);
  v39 = [v5 buildFeatures];
  id v40 = [v38 initWithArray:v39];

  if (v40 && [v40 count]) {
    [v6 setObject:v40 forKey:@"build-features"];
  }
  v176 = v40;
  v41 = [v5 enqueuerProperties];
  id v42 = v6;
  v43 = v42;
  v177 = v7;
  if (v41)
  {
    id v44 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:8];

    id v45 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
    v46 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v41 isSBEnabled]);
    [v45 setObject:v46 forKey:@"sb-enabled"];

    v47 = [v41 deviceName];
    if ([v47 length]) {
      [v45 setObject:v47 forKey:@"device-name"];
    }
    v48 = [v41 storeFrontID];
    if ([v48 length]) {
      [v45 setObject:v48 forKey:@"store-front"];
    }
    id v182 = v44;
    v174 = [v41 timeZone];
    v49 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v174 secondsFromGMT]);
    [v45 setObject:v49 forKey:@"utc-offset-in-seconds"];

    v50 = [v41 buildVersion];
    if ([v50 length]) {
      [v45 setObject:v50 forKey:@"build-version"];
    }
    v51 = [v41 deviceGUID];
    if ([v51 length]) {
      [v45 setObject:v51 forKey:@"guid"];
    }
    v52 = [v41 isPrivateListeningEnabled];
    if (v52) {
      [v45 setObject:v52 forKey:@"private-enabled"];
    }
    if ([v41 systemReleaseType] == (id)4) {
      [v45 setObject:&__kCFBooleanTrue forKey:@"internal-build"];
    }
    v53 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v41 storeAccountID]);
    [v45 setObject:v53 forKey:@"dsid"];

    [v42 setObject:v45 forKey:@"enqueuer"];
    v43 = v182;
  }
  v54 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isSBEnabled]);
  [v43 setObject:v54 forKey:@"sb-enabled"];

  v55 = [v5 deviceName];
  if ([v55 length]) {
    [v43 setObject:v55 forKey:@"device-name"];
  }
  v56 = [v5 storeFrontID];
  if (!v56) {
    v56 = v180->_currentStoreFrontID;
  }
  if ([(NSString *)v56 length]) {
    [v43 setObject:v56 forKey:@"store-front"];
  }
  v57 = [v5 eventTimeZone];
  v58 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v57 secondsFromGMT]);
  [v43 setObject:v58 forKey:@"utc-offset-in-seconds"];

  v59 = [v5 buildVersion];
  if ([v59 length]) {
    [v43 setObject:v59 forKey:@"build-version"];
  }
  if ([v5 systemReleaseType] == (id)4) {
    [v43 setObject:&__kCFBooleanTrue forKey:@"internal-build"];
  }
  id v183 = v43;
  v60 = [v5 isPrivateListeningEnabled];
  if (v60) {
    [v183 setObject:v60 forKey:@"private-enabled"];
  }

  id v61 = v183;
  if (v41 && v183 != v42) {
    [v42 setObject:v183 forKey:@"player"];
  }
  v165 = (char *)objc_msgSend(v5, "containerType", v61);
  if ((unint64_t)(v165 - 1) > 3) {
    uint64_t v62 = 0;
  }
  else {
    uint64_t v62 = qword_100152498[(void)(v165 - 1)];
  }
  v64 = +[NSNumber numberWithInteger:v62];
  [v42 setObject:v64 forKey:@"container-type"];

  if (v179 != (id)1)
  {
    [v5 itemEndTime];
    v66 = +[NSNumber numberWithLongLong:(uint64_t)(v65 * 1000.0)];
    [v42 setObject:v66 forKey:@"end-position-in-milliseconds"];

    if (v179 == (id)2)
    {
      v69 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 displayType]);
      [v42 setObject:v69 forKey:@"display-type"];

      v70 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 lyricsDisplayedCharacterCount]);
      [v42 setObject:v70 forKey:@"character-displayed-count"];

      v71 = [v5 lyricsLanguage];
      if (![v71 length])
      {
LABEL_83:

        goto LABEL_84;
      }
      CFStringRef v72 = @"lyric-language";
    }
    else
    {
      if (v179) {
        goto LABEL_84;
      }
      unint64_t v67 = (unint64_t)[v5 endReasonType] - 1;
      if (v67 > 0xE) {
        uint64_t v68 = 0;
      }
      else {
        uint64_t v68 = qword_1001524B8[v67];
      }
      v73 = +[NSNumber numberWithInteger:v68];
      [v42 setObject:v73 forKey:@"end-reason-type"];

      id v74 = [v5 vocalAttenuationAvailability];
      if (v74 == (id)2) {
        uint64_t v75 = 2;
      }
      else {
        uint64_t v75 = v74 == (id)1;
      }
      v76 = +[NSNumber numberWithInteger:v75];
      [v42 setObject:v76 forKey:@"attenuation-available"];

      [v5 vocalAttenuationDuration];
      v71 = +[NSNumber numberWithLongLong:(uint64_t)(v77 * 1000.0)];
      CFStringRef v72 = @"vocal-attenuation-duration-in-milliseconds";
    }
    [v42 setObject:v71 forKey:v72];
    goto LABEL_83;
  }
LABEL_84:
  v78 = [v5 featureName];
  if ([v78 length]) {
    [v42 setObject:v78 forKey:@"feature-name"];
  }
  [v5 itemDuration];
  v80 = +[NSNumber numberWithLongLong:(uint64_t)(v79 * 1000.0)];
  [v42 setObject:v80 forKey:@"media-duration-in-milliseconds"];

  v81 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 mediaType] == (id)1);
  [v42 setObject:v81 forKey:@"media-type"];

  v82 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isOffline]);
  [v42 setObject:v82 forKey:@"offline"];

  id v83 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  v84 = (char *)[v5 repeatPlayMode];
  if ((unint64_t)(v84 - 1) >= 3) {
    v85 = 0;
  }
  else {
    v85 = v84;
  }
  v86 = +[NSNumber numberWithInteger:v85];
  [v83 setObject:v86 forKey:@"repeat-play-mode"];

  id v87 = [v5 shufflePlayMode];
  if (v87 == (id)2) {
    uint64_t v88 = 2;
  }
  else {
    uint64_t v88 = v87 == (id)1;
  }
  v89 = +[NSNumber numberWithInteger:v88];
  [v83 setObject:v89 forKey:@"shuffle-play-mode"];

  v90 = (char *)[v5 autoPlayMode];
  if ((unint64_t)(v90 - 1) >= 3) {
    v91 = 0;
  }
  else {
    v91 = v90;
  }
  v92 = +[NSNumber numberWithInteger:v91];
  [v83 setObject:v92 forKey:@"auto-play-mode"];

  if ([v83 count]) {
    [v42 setObject:v83 forKey:@"play-mode"];
  }
  id quot = [v5 persistentID];
  v173 = v83;
  v175 = v78;
  if (quot)
  {
    unint64_t v94 = (unint64_t)quot;
    v95 = (char *)v185 + 1;
    do
    {
      lldiv_t v96 = lldiv((uint64_t)quot, 10);
      id quot = (id)v96.quot;
      if (v96.rem >= 0) {
        LOBYTE(v97) = v96.rem;
      }
      else {
        uint64_t v97 = -v96.rem;
      }
      *(v95 - 2) = v97 + 48;
      v98 = (const UInt8 *)(v95 - 2);
      --v95;
    }
    while (v96.quot);
    if ((v94 & 0x8000000000000000) != 0)
    {
      *(v95 - 2) = 45;
      v98 = (const UInt8 *)(v95 - 2);
    }
    v99 = (__CFString *)CFStringCreateWithBytes(0, v98, (char *)v185 - (char *)v98, 0x8000100u, 0);
    [v42 setObject:v99 forKey:@"persistent-id"];
  }
  v100 = [v5 queueGroupingID];
  if ([v100 length]) {
    [v42 setObject:v100 forKey:@"queue-grouping-id"];
  }
  id v101 = [v5 sharedActivityGroupSizeCurrent];
  if (v101)
  {
    v102 = sub_10007C7E4((unint64_t)v101);
    [v42 setObject:v102 forKey:@"shared-activity-devices-current"];

    v103 = sub_10007C7E4((unint64_t)[v5 sharedActivityGroupSizeMax]);
    [v42 setObject:v103 forKey:@"shared-activity-devices-max"];
  }
  else
  {
    [v5 sharedActivityGroupSizeMax];
  }
  unint64_t v104 = (unint64_t)[v5 sharedActivityType];
  if (v104 <= 6)
  {
    unint64_t v105 = v104;
    if (((1 << v104) & 0x72) != 0)
    {
      v106 = +[NSNumber numberWithInteger:v104];
      [v42 setObject:v106 forKey:@"shared-activity-type"];
    }
  }
  if (objc_msgSend(v5, "isCollaborativePlaylist", v105))
  {
    v107 = +[NSNumber numberWithBool:1];
    [v42 setObject:v107 forKey:@"is-collaborative"];
  }
  v108 = [v5 eventDate];
  v109 = v108;
  if (v108)
  {
    [v108 timeIntervalSinceNow];
    v111 = +[NSNumber numberWithLongLong:(uint64_t)(v110 * -1000.0) & ~((uint64_t)(v110 * -1000.0) >> 63)];
    [v42 setObject:v111 forKey:@"milliseconds-since-play"];
  }
  v112 = [v5 recommendationData];
  if ([v112 length]) {
    [v42 setObject:v112 forKey:@"reco-data"];
  }
  v170 = v112;
  id v113 = [v5 sourceType];
  if (v113 == (id)2) {
    uint64_t v114 = 7;
  }
  else {
    uint64_t v114 = v113 == (id)1;
  }
  v115 = +[NSNumber numberWithInteger:v114];
  [v42 setObject:v115 forKey:@"source-type"];

  [v5 itemStartTime];
  v117 = +[NSNumber numberWithLongLong:(uint64_t)(v116 * 1000.0)];
  [v42 setObject:v117 forKey:@"start-position-in-milliseconds"];

  v118 = [v5 timedMetadata];
  if ([v118 length]) {
    [v42 setObject:v118 forKey:@"timed-metadata"];
  }
  v181 = [v5 trackInfo];
  v169 = v118;
  if ([v181 length])
  {
    v119 = +[NSPropertyListSerialization propertyListWithData:v181 options:0 format:0 error:0];
    if (v119) {
      [v42 setObject:v119 forKey:@"track-info"];
    }
  }
  v171 = v109;
  v120 = (char *)[v5 itemType];
  if ((unint64_t)(v120 - 1) > 8) {
    uint64_t v121 = 0;
  }
  else {
    uint64_t v121 = qword_100152530[(void)(v120 - 1)];
  }
  v122 = +[NSNumber numberWithInteger:v121];
  [v42 setObject:v122 forKey:@"type"];

  uint64_t v123 = [v5 requestingBundleIdentifier];
  if (v123) {
    [v42 setObject:v123 forKey:@"bundle-id"];
  }
  uint64_t v124 = [v5 requestingBundleVersion];
  if (v124) {
    [v42 setObject:v124 forKey:@"bundle-version"];
  }
  v167 = (void *)v124;
  v125 = [v5 householdID];
  if ([v125 length]) {
    [v42 setObject:v125 forKey:@"household-id"];
  }
  v126 = [v5 isSiriInitiated];
  if (v126) {
    [v42 setObject:v126 forKey:@"siri-initiated"];
  }
  v178 = v126;
  v172 = v100;
  v168 = (void *)v123;
  v166 = v125;
  if ((uint64_t)[v5 version] > 1)
  {
    v164 = v41;
    v133 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 reasonHintType] == (id)1);
    [v42 setObject:v133 forKey:@"event-reason-hint-type"];

    if (v179 == (id)2) {
      uint64_t v134 = 2;
    }
    else {
      uint64_t v134 = v179 == (id)1;
    }
    v135 = +[NSNumber numberWithInteger:v134];
    [v42 setObject:v135 forKey:@"event-type"];

    id v127 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:8];
    v136 = [v5 itemIDs];
    v128 = v136;
    if (v165 == (char *)1)
    {
      id v137 = [v136 radioAdamID];
      if (v137)
      {
        v138 = +[NSNumber numberWithLongLong:v137];
        CFStringRef v139 = @"radio-adam-id";
LABEL_168:
        [v127 setObject:v138 forKey:v139];
      }
    }
    else
    {
      id v140 = [v136 subscriptionAdamID];
      id v141 = v140;
      if (v120 != (char *)6)
      {
        if (v140)
        {
          v142 = +[NSNumber numberWithLongLong:v140];
          [v127 setObject:v142 forKey:@"subscription-adam-id"];
        }
        id v143 = objc_msgSend(v128, "equivalencySourceAdamID", v141);
        if (v143)
        {
          v144 = +[NSNumber numberWithLongLong:v143];
          [v127 setObject:v144 forKey:@"orig-sf-adam-id"];
        }
        id v145 = [v128 purchasedAdamID];
        if (v145)
        {
          v146 = +[NSNumber numberWithLongLong:v145];
          [v127 setObject:v146 forKey:@"purchased-adam-id"];
        }
        id v147 = [v128 cloudID];
        if (v147)
        {
          v148 = +[NSNumber numberWithLongLong:v147];
          [v127 setObject:v148 forKey:@"cloud-id"];
        }
        id v149 = [v128 reportingAdamID];
        if (!v149) {
          goto LABEL_169;
        }
        v138 = +[NSNumber numberWithLongLong:v149];
        CFStringRef v139 = @"reporting-adam-id";
        goto LABEL_168;
      }
      if (v140)
      {
        v138 = +[NSNumber numberWithLongLong:v140];
        CFStringRef v139 = @"auc-adam-id";
        goto LABEL_168;
      }
    }
LABEL_169:
    v131 = [v128 lyricsID];
    if ([v131 length]) {
      [v127 setObject:v131 forKey:@"lyric-id"];
    }
    if ([v127 count]) {
      [v42 setObject:v127 forKey:@"ids"];
    }
    v132 = [v5 containerIDs];
    id v150 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
    switch((unint64_t)v165)
    {
      case 1uLL:
        v151 = [v132 stationHash];
        if ([v151 length]) {
          [v150 setObject:v151 forKey:@"station-hash"];
        }
        v152 = [v132 stationStringID];
        if ([v152 length]) {
          [v150 setObject:v152 forKey:@"station-id"];
        }
        id v153 = [v132 stationID];
        if (!v153) {
          goto LABEL_187;
        }
        v154 = +[NSNumber numberWithLongLong:v153];
        CFStringRef v155 = @"station-personalized-id";
        goto LABEL_186;
      case 2uLL:
        v151 = [v132 globalPlaylistID];
        if ([v151 length]) {
          [v150 setObject:v151 forKey:@"global-playlist-id"];
        }
        v152 = [v132 playlistVersionHash];
        if ([v152 length]) {
          [v150 setObject:v152 forKey:@"playlist-version-hash"];
        }
        id v156 = [v132 cloudPlaylistID];
        if (v156)
        {
          v154 = +[NSNumber numberWithLongLong:v156];
          CFStringRef v155 = @"cloud-playlist-id";
LABEL_186:
          [v150 setObject:v154 forKey:v155];
        }
LABEL_187:

        v126 = v178;
        goto LABEL_195;
      case 3uLL:
        id v157 = [v132 adamID];
        if (!v157) {
          goto LABEL_196;
        }
        v151 = +[NSNumber numberWithLongLong:v157];
        CFStringRef v158 = @"artist-adam-id";
        break;
      case 4uLL:
        id v159 = [v132 adamID];
        if (v159)
        {
          v160 = +[NSNumber numberWithLongLong:v159];
          [v150 setObject:v160 forKey:@"album-adam-id"];
        }
        v151 = [v132 cloudAlbumID];
        if (![v151 length]) {
          goto LABEL_195;
        }
        CFStringRef v158 = @"cloud-album-id";
        break;
      default:
        goto LABEL_196;
    }
    [v150 setObject:v151 forKey:v158];
LABEL_195:

LABEL_196:
    if ([v150 count]) {
      [v42 setObject:v150 forKey:@"container-ids"];
    }

    v41 = v164;
    v129 = v170;
    v130 = v167;
    goto LABEL_199;
  }
  id v127 = [v5 containerID];
  if (v127) {
    [v42 setObject:v127 forKey:@"container-id"];
  }
  v128 = [v5 externalID];
  v129 = v170;
  v130 = v167;
  if (v128) {
    [v42 setObject:v128 forKey:@"external-identifier"];
  }
  v131 = [v5 personalizedContainerID];
  if ([v131 length]) {
    [v42 setObject:v131 forKey:@"personalized-container-id"];
  }
  v132 = [v5 storeID];
  if ([v132 length]) {
    [v42 setObject:v132 forKey:@"id"];
  }
LABEL_199:

  id v161 = [v42 count];
  v162 = &__NSDictionary0__struct;
  if (v161) {
    v162 = v42;
  }
  id v63 = v162;

LABEL_202:

  return v63;
}

@end