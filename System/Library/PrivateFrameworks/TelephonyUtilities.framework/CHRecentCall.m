@interface CHRecentCall
+ (id)predicateForFilteringOutFaceTimeAudioCalls;
+ (id)recentCallJunkIdentificationCategoryString:(int64_t)a3;
+ (int64_t)toCHEmergencyMediaType:(int64_t)a3;
- (CHRecentCall)initWithConversation:(id)a3 startDate:(id)a4 avMode:(unint64_t)a5;
- (id)initWithCall:(id)a3;
- (id)provider;
@end

@implementation CHRecentCall

- (id)initWithCall:(id)a3
{
  id v5 = a3;
  v6 = [(CHRecentCall *)self init];

  if (!v6) {
    goto LABEL_108;
  }
  v7 = [v5 callHistoryIdentifier];

  if (!v7)
  {
    v8 = +[NSString stringWithFormat:@"This call's call history identifier is nil"];
    NSLog(@"** TUAssertion failure: %@", v8);

    if (_TUAssertShouldCrashApplication())
    {
      v9 = [v5 callHistoryIdentifier];

      if (!v9)
      {
        v119 = +[NSAssertionHandler currentHandler];
        [v119 handleFailureInMethod:a2 object:v6 file:@"CHRecentCall_CSD.m" lineNumber:40 description:@"This call's call history identifier is nil"];
      }
    }
  }
  v10 = [v5 localSenderIdentityAccountUUID];
  [(CHRecentCall *)v6 setLocalParticipantUUID:v10];

  id v121 = v5;
  id v11 = v5;
  v12 = LSApplicationWorkspace_ptr;
  v13 = [v11 remoteParticipantHandles];
  v14 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v13 count]);

  id v15 = v11;
  v16 = [v15 remoteParticipantHandles];
  v17 = [v15 callCenter];
  v18 = [v17 activeConversationForCall:v15 backedByGroupSession:1];

  v122 = v15;
  if (v18)
  {
    v19 = v6;
    v20 = +[NSMutableSet set];
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    v21 = [v18 mergedRemoteMembers];
    id v22 = [v21 countByEnumeratingWithState:&v128 objects:v133 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v129;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v129 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v128 + 1) + 8 * i) handle];
          [v20 addObject:v26];
        }
        id v23 = [v21 countByEnumeratingWithState:&v128 objects:v133 count:16];
      }
      while (v23);
    }

    if ([v20 count])
    {
      id v27 = [v20 copy];

      v16 = v27;
    }
    v6 = v19;
    v12 = LSApplicationWorkspace_ptr;

    id v15 = v122;
  }
  else
  {
    uint64_t v28 = objc_msgSend(v16, "bs_filter:", &stru_1005081B0);

    v16 = (void *)v28;
  }

  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v29 = v16;
  id v30 = [v29 countByEnumeratingWithState:&v128 objects:v133 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v129;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v129 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = +[CHHandle handleWithTUHandle:*(void *)(*((void *)&v128 + 1) + 8 * (void)j)];
        [v14 addObject:v34];
      }
      id v31 = [v29 countByEnumeratingWithState:&v128 objects:v133 count:16];
    }
    while (v31);
  }

  id v35 = [v14 copy];
  [(CHRecentCall *)v6 setRemoteParticipantHandles:v35];

  v36 = [v15 initiator];
  v37 = +[CHHandle handleWithTUHandle:v36];
  v120 = v6;
  [(CHRecentCall *)v6 setInitiator:v37];

  id v38 = objc_alloc((Class)v12[29]);
  v39 = [v15 emergencyMediaItems];
  id v123 = objc_msgSend(v38, "initWithCapacity:", objc_msgSend(v39, "count"));

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  v40 = [v15 emergencyMediaItems];
  id v41 = [v40 countByEnumeratingWithState:&v124 objects:v132 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v125;
    do
    {
      for (k = 0; k != v42; k = (char *)k + 1)
      {
        if (*(void *)v125 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v124 + 1) + 8 * (void)k);
        id v46 = objc_alloc((Class)CHEmergencyMediaItem);
        v47 = [v45 assetId];
        id v48 = objc_msgSend(v46, "initWithAssetId:mediaType:", v47, +[CHRecentCall toCHEmergencyMediaType:](CHRecentCall, "toCHEmergencyMediaType:", objc_msgSend(v45, "emergencyMediaType")));

        [v123 addObject:v48];
      }
      id v42 = [v40 countByEnumeratingWithState:&v124 objects:v132 count:16];
    }
    while (v42);
  }

  v6 = v120;
  [(CHRecentCall *)v120 setEmergencyMediaItems:v123];
  -[CHRecentCall setUsedEmergencyVideoStreaming:](v120, "setUsedEmergencyVideoStreaming:", [v122 hasEmergencyVideoStream]);
  -[CHRecentCall setWasEmergencyCall:](v120, "setWasEmergencyCall:", [v122 isEmergency]);
  v49 = [v122 handle];
  v50 = [v49 value];
  [(CHRecentCall *)v120 setCallerId:v50];

  v51 = [v122 handle];
  [(CHRecentCall *)v120 setHandleType:+[CHHandle handleTypeForTUHandle:v51]];

  if ([v122 isJunk])
  {
    [(CHRecentCall *)v120 setName:0];
  }
  else
  {
    v52 = [v122 callerNameFromNetwork];
    [(CHRecentCall *)v120 setName:v52];
  }
  v53 = [v122 callDirectoryName];

  if (v53)
  {
    v54 = [v122 callDirectoryName];
    [(CHRecentCall *)v120 setName:v54];
  }
  uint64_t v55 = [v122 imageURL];
  if (v55)
  {
    v56 = (void *)v55;
    v57 = [v122 callDirectoryName];

    if (!v57)
    {
      v58 = +[NSURL fileURLWithPath:@"/stock" isDirectory:0];
      [(CHRecentCall *)v120 setImageURL:v58];

      v59 = [v122 companyName];

      if (v59)
      {
        v60 = [v122 companyName];
        [(CHRecentCall *)v120 setName:v60];
      }
    }
  }
  v61 = [v122 callHistoryIdentifier];
  [(CHRecentCall *)v120 setUniqueId:v61];

  v62 = [v122 isoCountryCode];
  [(CHRecentCall *)v120 setIsoCountryCode:v62];

  [v122 callDuration];
  v64 = +[NSDate dateWithTimeIntervalSinceNow:-v63];
  [(CHRecentCall *)v120 setDate:v64];

  unsigned __int8 v65 = [v122 isScreening];
  double v66 = 0.0;
  if ((v65 & 1) == 0) {
    objc_msgSend(v122, "callDuration", 0.0);
  }
  [(CHRecentCall *)v120 setDuration:v66];
  id v67 = v122;
  if ([v67 isVideo])
  {
    uint64_t v68 = 2;
  }
  else if ([v67 isThirdPartyVideo])
  {
    uint64_t v68 = 2;
  }
  else
  {
    uint64_t v68 = 1;
  }

  [(CHRecentCall *)v120 setMediaType:v68];
  unsigned int v69 = [v67 ttyType];
  if (v69 == 1) {
    uint64_t v70 = 1;
  }
  else {
    uint64_t v70 = 2 * (v69 == 2);
  }
  [(CHRecentCall *)v120 setTtyType:v70];
  id v71 = v67;
  v72 = [v71 provider];
  v73 = [v72 identifier];

  v74 = [v71 provider];
  unsigned __int8 v75 = [v74 isTelephonyProvider];

  if (v75)
  {
    v76 = (id *)&kCHServiceProviderTelephony;
  }
  else
  {
    v77 = [v71 provider];
    unsigned int v78 = [v77 isFaceTimeProvider];

    if (!v78) {
      goto LABEL_56;
    }
    v76 = (id *)&kCHServiceProviderFaceTime;
  }
  id v79 = *v76;

  v73 = v79;
LABEL_56:

  [(CHRecentCall *)v120 setServiceProvider:v73];
  if ((uint64_t)[v71 bytesOfDataUsed] >= 1)
  {
    v80 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v71 bytesOfDataUsed]);
    [(CHRecentCall *)v120 setBytesOfDataUsed:v80];
  }
  if ([v71 isScreening]) {
    unsigned int v81 = [v71 isScreeningDueToUserInteraction];
  }
  else {
    unsigned int v81 = 1;
  }
  if ([v71 disconnectedReason] == 1
    || ([v71 wasDeclined] & 1) != 0)
  {
    uint64_t v82 = 1;
  }
  else
  {
    uint64_t v82 = (uint64_t)[v71 isOutgoing];
    if ((v82 & 1) == 0 && ((v81 ^ 1) & 1) == 0)
    {
      objc_msgSend(v71, "callDuration", v82);
      uint64_t v82 = v88 > 0.0;
    }
  }
  [(CHRecentCall *)v120 setRead:v82];
  id v83 = [v71 verificationStatus];
  if ((unint64_t)v83 <= 4) {
    [(CHRecentCall *)v120 setVerificationStatus:v83];
  }
  id v84 = v71;
  if ([v84 isOutgoing])
  {
    [v84 callDuration];
    if (v85 <= 0.0) {
      v86 = (unsigned int *)&kCHCallStatusCancelled;
    }
    else {
      v86 = (unsigned int *)&kCHCallStatusConnectedOutgoing;
    }
  }
  else
  {
    v86 = (unsigned int *)&kCHCallStatusMissed;
    if (([v84 isScreening] & 1) == 0)
    {
      [v84 callDuration];
      if (v87 <= 0.0)
      {
        if ([v84 disconnectedReason] == 1) {
          v86 = (unsigned int *)&kCHCallStatusAnsweredElsewhere;
        }
      }
      else
      {
        v86 = (unsigned int *)&kCHCallStatusConnectedIncoming;
      }
    }
  }
  uint64_t v89 = *v86;

  [(CHRecentCall *)v120 setCallStatus:v89];
  v90 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v84 disconnectedReason]);
  [(CHRecentCall *)v120 setDisconnectedCause:v90];

  id v5 = v121;
  if (([v84 isScreening] & 1) != 0
    || ([v84 wasScreened] & 1) == 0)
  {
    v91 = [v84 blockedByExtension];

    if (v91)
    {
      v92 = [v84 blockedByExtension];
      [(CHRecentCall *)v120 setBlockedByExtension:v92];

      v93 = [(CHRecentCall *)v120 blockedByExtension];
      v94 = +[NSExtension extensionWithIdentifier:v93 error:0];

      if (v94)
      {
        v95 = [v94 _plugIn];
        v96 = [v95 localizedContainingName];
        [(CHRecentCall *)v120 setBlockedByExtensionName:v96];
      }
      else
      {
        v95 = [(CHRecentCall *)v120 blockedByExtension];
        [(CHRecentCall *)v120 setBlockedByExtensionName:v95];
      }
    }
    v97 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v84 filteredOutReason]);
    [(CHRecentCall *)v120 setFilteredOutReason:v97];
  }
  if ([v84 isBlocked])
  {
    [(CHRecentCall *)v120 setCallerIdAvailability:1];
  }
  else
  {
    v98 = [v84 handle];
    v99 = [v98 value];
    -[CHRecentCall setCallerIdAvailability:](v120, "setCallerIdAvailability:", 2 * ([v99 length] == 0));
  }
  id v100 = v84;
  if ([v100 isJunk])
  {
    v101 = (char *)[v100 junkConfidence];
    if ((unint64_t)(v101 - 1) >= 3) {
      v102 = 0;
    }
    else {
      v102 = v101;
    }
  }
  else
  {
    v102 = 0;
  }

  [(CHRecentCall *)v120 setJunkConfidence:v102];
  if ([v100 isJunk])
  {
    v103 = +[CHRecentCall recentCallJunkIdentificationCategoryString:](CHRecentCall, "recentCallJunkIdentificationCategoryString:", [v100 identificationCategory]);
    [(CHRecentCall *)v120 setJunkIdentificationCategory:v103];
  }
  else
  {
    [(CHRecentCall *)v120 setJunkIdentificationCategory:0];
  }
  v104 = [v100 conversationID];
  [(CHRecentCall *)v120 setConversationID:v104];

  id v105 = [v100 callDirectoryIdentityType];
  if (v105 == (id)2) {
    uint64_t v106 = 2;
  }
  else {
    uint64_t v106 = v105 == (id)1;
  }
  [(CHRecentCall *)v120 setCallDirectoryIdentityType:v106];
  v107 = [v100 callDirectoryIdentityExtension];
  [(CHRecentCall *)v120 setIdentityExtension:v107];

  v108 = [v100 dateConnected];

  if (v108)
  {
    uint64_t v109 = [v100 dateConnected];
LABEL_104:
    v111 = (void *)v109;
    v112 = [v100 dateCreated];
    [v111 timeIntervalSinceDate:v112];
    v113 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(CHRecentCall *)v120 setTimeToEstablish:v113];

    goto LABEL_105;
  }
  v110 = [v100 dateEnded];

  if (v110)
  {
    uint64_t v109 = [v100 dateEnded];
    goto LABEL_104;
  }
LABEL_105:
  v114 = [v100 provider];
  unsigned int v115 = [v114 isFaceTimeProvider];

  if (v115)
  {
    v116 = [v100 callGroupUUID];
    [(CHRecentCall *)v120 setParticipantGroupUUID:v116];
  }
  -[CHRecentCall setScreenSharingType:](v120, "setScreenSharingType:", (unint64_t)[v100 screenSharingType] & 3);

LABEL_108:
  v117 = v6;

  return v117;
}

- (CHRecentCall)initWithConversation:(id)a3 startDate:(id)a4 avMode:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(CHRecentCall *)self init];
  if (v10)
  {
    id v33 = v9;
    id v34 = v8;
    id v11 = v8;
    v12 = [v11 remoteMembers];
    v13 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v12 count]);

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v14 = [v11 mergedRemoteMembers];
    id v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v36;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v35 + 1) + 8 * i) handle];
          v20 = +[CHHandle handleWithTUHandle:v19];
          [v13 addObject:v20];
        }
        id v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v16);
    }

    id v21 = [v13 copy];
    [(CHRecentCall *)v10 setRemoteParticipantHandles:v21];

    id v22 = [v11 initiator];
    id v23 = +[CHHandle handleWithTUHandle:v22];
    [(CHRecentCall *)v10 setInitiator:v23];

    uint64_t v24 = [v11 UUID];
    v25 = [v24 UUIDString];
    [(CHRecentCall *)v10 setUniqueId:v25];

    id v9 = v33;
    [(CHRecentCall *)v10 setDate:v33];
    v26 = +[NSDate date];
    [v26 timeIntervalSinceDate:v33];
    -[CHRecentCall setDuration:](v10, "setDuration:");

    [(CHRecentCall *)v10 setTtyType:0];
    [(CHRecentCall *)v10 setServiceProvider:kCHServiceProviderFaceTime];
    if (a5 == 1) {
      uint64_t v27 = 1;
    }
    else {
      uint64_t v27 = 2;
    }
    [(CHRecentCall *)v10 setMediaType:v27];
    [(CHRecentCall *)v10 setRead:1];
    [(CHRecentCall *)v10 setVerificationStatus:0];
    [(CHRecentCall *)v10 setCallStatus:kCHCallStatusConnectedOutgoing];
    uint64_t v28 = +[NSNumber numberWithInteger:0];
    [(CHRecentCall *)v10 setDisconnectedCause:v28];

    id v29 = +[NSNumber numberWithInteger:0];
    [(CHRecentCall *)v10 setFilteredOutReason:v29];

    [(CHRecentCall *)v10 setJunkConfidence:0];
    id v30 = +[CHRecentCall recentCallJunkIdentificationCategoryString:0];
    [(CHRecentCall *)v10 setJunkIdentificationCategory:v30];

    id v31 = [v11 groupUUID];
    [(CHRecentCall *)v10 setParticipantGroupUUID:v31];

    -[CHRecentCall setScreenSharingType:](v10, "setScreenSharingType:", (unint64_t)[v11 screenSharingType] & 3);
    id v8 = v34;
  }

  return v10;
}

- (id)provider
{
  v3 = +[TUCallCenter sharedInstance];
  v4 = [v3 providerManager];
  id v5 = [v4 providerForRecentCall:self];

  return v5;
}

+ (id)predicateForFilteringOutFaceTimeAudioCalls
{
  v2 = +[NSNumber numberWithUnsignedInt:kCHCallCategoryAudio];
  v3 = +[NSPredicate predicateWithFormat:@"!(call_category == %@ && service_provider == %@)", v2, kCHServiceProviderFaceTime];

  return v3;
}

+ (int64_t)toCHEmergencyMediaType:(int64_t)a3
{
  return a3 != 0;
}

+ (id)recentCallJunkIdentificationCategoryString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x12) {
    return 0;
  }
  else {
    return off_1005081D0[a3 - 1];
  }
}

@end