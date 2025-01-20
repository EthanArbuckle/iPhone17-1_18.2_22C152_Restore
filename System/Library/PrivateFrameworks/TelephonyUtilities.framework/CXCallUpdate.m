@interface CXCallUpdate
- (BOOL)isRemoteMomentsAvailable;
- (CXCallUpdate)initWithDialRequest:(id)a3;
- (CXCallUpdate)initWithFaceTimeIDSChat:(id)a3;
- (CXCallUpdate)initWithIDSChat:(id)a3;
- (CXCallUpdate)initWithIMAVChat:(id)a3;
- (CXCallUpdate)initWithJoinConversationRequest:(id)a3;
- (CXCallUpdate)initWithStartCallAction:(id)a3;
- (CXCallUpdate)initWithTUConversation:(id)a3;
- (CXCallUpdate)initWithTinCanIDSChat:(id)a3;
- (CXCallUpdate)sanitizedCallUpdate;
- (NSNumber)handoffRecipientParticipant;
- (NSString)localizedHandoffRecipientDeviceCategory;
- (NSString)remoteIDSDestination;
- (NSUUID)conversationID;
- (TUMediaTokens)tuMediaTokens;
- (id)tuCallUpdateWithProvider:(id)a3 withCallUUID:(id)a4;
- (int64_t)faceTimeTransportType;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (unint64_t)initialLinkType;
- (void)setConversationID:(id)a3;
- (void)setFaceTimeTransportType:(int64_t)a3;
- (void)setHandoffRecipientParticipant:(id)a3;
- (void)setInitialLinkType:(unint64_t)a3;
- (void)setInputAudioPowerSpectrumToken:(int64_t)a3;
- (void)setLocalizedHandoffRecipientDeviceCategory:(id)a3;
- (void)setOutputAudioPowerSpectrumToken:(int64_t)a3;
- (void)setRemoteIDSDestination:(id)a3;
- (void)setRemoteMomentsAvailable:(BOOL)a3;
- (void)updatePropertiesForVideo:(BOOL)a3;
@end

@implementation CXCallUpdate

- (CXCallUpdate)initWithFaceTimeIDSChat:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self initWithIDSChat:v4];
  v6 = v5;
  if (v5)
  {
    [(CXCallUpdate *)v5 setFaceTimeTransportType:2];
    -[CXCallUpdate setRemoteMomentsAvailable:](v6, "setRemoteMomentsAvailable:", [v4 isRemoteMomentsAvailable]);
    -[CXCallUpdate setShouldSuppressInCallUI:](v6, "setShouldSuppressInCallUI:", [v4 shouldSuppressInCallUI]);
    [(CXCallUpdate *)v6 setSupportsScreening:0];
    [(CXCallUpdate *)v6 setSupportsRecording:0];
    [(CXCallUpdate *)v6 setIsUnderlyingLinksConnected:1];
  }

  return v6;
}

- (CXCallUpdate)initWithIMAVChat:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self init];
  if (v5)
  {
    id v6 = objc_alloc((Class)CXHandle);
    v7 = [v4 otherIMHandle];
    v8 = [v7 ID];
    id v9 = [v6 initWithDestinationID:v8];
    [(CXCallUpdate *)v5 setRemoteHandle:v9];

    -[CXCallUpdate setSupportsHolding:](v5, "setSupportsHolding:", [v4 isVideo] ^ 1);
    [(CXCallUpdate *)v5 setSupportsGrouping:0];
    [(CXCallUpdate *)v5 setSupportsUngrouping:0];
    [(CXCallUpdate *)v5 setSupportsDTMF:0];
    [(CXCallUpdate *)v5 setSupportsRecording:0];
    [(CXCallUpdate *)v5 setIsUnderlyingLinksConnected:1];
    [(CXCallUpdate *)v5 setSupportsScreening:0];
    [(CXCallUpdate *)v5 setRequiresInCallSounds:1];
    v10 = sub_100023CA4(v4);
    [(CXCallUpdate *)v5 setCrossDeviceIdentifier:v10];

    [(CXCallUpdate *)v5 setAudioInterruptionProvider:1];
    if ([v4 isVideo]) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 3;
    }
    [(CXCallUpdate *)v5 setAudioInterruptionOperationMode:v11];
    if (!qword_10058C1E0)
    {
      v12 = (void **)CUTWeakLinkSymbol();
      if (v12) {
        v13 = *v12;
      }
      else {
        v13 = 0;
      }
      objc_storeStrong((id *)&qword_10058C1E0, v13);
    }
    -[CXCallUpdate setAudioCategory:](v5, "setAudioCategory:");
    -[CXCallUpdate updatePropertiesForVideo:](v5, "updatePropertiesForVideo:", [v4 isVideo]);
  }

  return v5;
}

- (CXCallUpdate)initWithTUConversation:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self init];
  if (!v5) {
    goto LABEL_93;
  }
  id v6 = +[NSMutableSet set];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v7 = [v4 remoteMembers];
  id v8 = [v7 countByEnumeratingWithState:&v99 objects:v108 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v100;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v100 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v99 + 1) + 8 * i) handle];
        v13 = +[CXHandle handleWithTUHandle:v12];
        [v6 addObject:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v99 objects:v108 count:16];
    }
    while (v9);
  }

  [(CXCallUpdate *)v5 setRemoteParticipantHandles:v6];
  v14 = [v4 localMember];
  v15 = [v14 handle];
  v16 = [v15 value];
  [(CXCallUpdate *)v5 setLocalMemberHandleValue:v16];

  v17 = [(CXCallUpdate *)v5 remoteParticipantHandles];
  v18 = [v17 anyObject];
  [(CXCallUpdate *)v5 setRemoteHandle:v18];

  v19 = [v4 initiator];
  v20 = +[CXHandle handleWithTUHandle:v19];
  [(CXCallUpdate *)v5 setInitiator:v20];

  v21 = [v4 groupUUID];
  [(CXCallUpdate *)v5 setParticipantGroupUUID:v21];

  [(CXCallUpdate *)v5 setSupportsGrouping:0];
  [(CXCallUpdate *)v5 setSupportsUngrouping:0];
  [(CXCallUpdate *)v5 setSupportsDTMF:0];
  v22 = [v4 remoteMembers];
  id v23 = [v22 count];
  BOOL v24 = 0;
  if (v23 == (id)1) {
    BOOL v24 = objc_msgSend(v4, "avMode", 0) != (id)2;
  }
  [(CXCallUpdate *)v5 setSupportsHolding:v24];

  v25 = [v4 remoteMembers];
  BOOL v26 = [v25 count] == (id)1 && objc_msgSend(v4, "avMode") != (id)2;
  [(CXCallUpdate *)v5 setSupportsRecording:v26];

  -[CXCallUpdate setIsUnderlyingLinksConnected:](v5, "setIsUnderlyingLinksConnected:", [v4 isUnderlyingLinksConnected]);
  v27 = [v4 localScreenSharingRequest];
  v28 = v27;
  if (v27)
  {
    if ([v27 type] == (id)2) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = 2;
    }
    [(CXCallUpdate *)v5 setScreenSharingIntention:v29];
  }
  if ((unint64_t)[v6 count] > 1 || objc_msgSend(v4, "avMode") == (id)2)
  {
    [(CXCallUpdate *)v5 setSupportsScreening:0];
  }
  else
  {
    v30 = [v4 screenSharingRequests];
    -[CXCallUpdate setSupportsScreening:](v5, "setSupportsScreening:", [v30 count] == 0);
  }
  v31 = [v4 provider];
  -[CXCallUpdate setMutuallyExclusiveCall:](v5, "setMutuallyExclusiveCall:", [v31 isDefaultProvider] ^ 1);

  if (![v4 isLocallyCreated]
    || ![v4 isOneToOneModeEnabled]
    || [v4 state] == (id)3)
  {
    [(CXCallUpdate *)v5 setConversation:1];
  }
  v32 = [v4 provider];
  if ([v32 isDefaultProvider])
  {
    v33 = [v4 localMember];
    -[CXCallUpdate setRequiresInCallSounds:](v5, "setRequiresInCallSounds:", [v33 isLightweightMember] ^ 1);
  }
  else
  {
    [(CXCallUpdate *)v5 setRequiresInCallSounds:0];
  }

  [(CXCallUpdate *)v5 setAudioInterruptionProvider:1];
  [(CXCallUpdate *)v5 setAudioInterruptionOperationMode:2];
  if (!qword_10058C1E8)
  {
    v34 = (void **)CUTWeakLinkSymbol();
    if (v34) {
      v35 = *v34;
    }
    else {
      v35 = 0;
    }
    objc_storeStrong((id *)&qword_10058C1E8, v35);
  }
  -[CXCallUpdate setAudioCategory:](v5, "setAudioCategory:");
  if ([v4 avMode])
  {
    -[CXCallUpdate updatePropertiesForVideo:](v5, "updatePropertiesForVideo:", [v4 avMode] == (id)2);
  }
  else
  {
    v36 = sub_100008DCC();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = [v4 UUID];
      *(_DWORD *)buf = 138412290;
      v107 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Not setting video properties for conversation UUID: %@ because we're in AVLess", buf, 0xCu);
    }
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v38 = [v4 activeRemoteParticipants];
  id v39 = [v38 countByEnumeratingWithState:&v95 objects:v105 count:16];
  v81 = v28;
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v96;
    while (2)
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(void *)v96 != v41) {
          objc_enumerationMutation(v38);
        }
        if ([*(id *)(*((void *)&v95 + 1) + 8 * (void)j) isScreenEnabled])
        {
          char v43 = 1;
          goto LABEL_50;
        }
      }
      id v40 = [v38 countByEnumeratingWithState:&v95 objects:v105 count:16];
      if (v40) {
        continue;
      }
      break;
    }
  }
  char v43 = 0;
LABEL_50:

  v44 = +[CPAudioRoutePolicyManager sharedInstance];
  unsigned int v45 = [v44 sharePlaySupported];

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v46 = [v4 activitySessions];
  id v47 = [v46 countByEnumeratingWithState:&v91 objects:v104 count:16];
  v82 = v6;
  if (v47)
  {
    id v48 = v47;
    LOBYTE(v49) = 0;
    uint64_t v50 = *(void *)v92;
    char v85 = v43;
    unsigned int v83 = v45;
    while (2)
    {
      id v51 = v4;
      for (k = 0; k != v48; k = (char *)k + 1)
      {
        if (*(void *)v92 != v50) {
          objc_enumerationMutation(v46);
        }
        v53 = *(void **)(*((void *)&v91 + 1) + 8 * (void)k);
        if (v49) {
          uint64_t v49 = 1;
        }
        else {
          uint64_t v49 = (uint64_t)[*(id *)(*((void *)&v91 + 1) + 8 * (void)k) isUsingAirplay];
        }
        id v54 = [v53 state];
        BOOL v55 = v54 != (id)4;
        if (v54 == (id)4) {
          goto LABEL_70;
        }
        if ([v53 state] == (id)1)
        {
          if (v49)
          {
            BOOL v55 = 1;
LABEL_70:
            uint64_t v49 = 1;
          }
          else
          {
            uint64_t v49 = (uint64_t)[v53 isUsingAirplay];
            BOOL v55 = 1;
          }
LABEL_72:
          id v4 = v51;
          char v43 = v85;
          unsigned int v45 = v83;
          goto LABEL_73;
        }
        v56 = [v53 activity];
        if ([v56 isScreenSharingActivity])
        {
          id v57 = [v53 state];

          if (!v57) {
            goto LABEL_72;
          }
        }
        else
        {
        }
      }
      id v48 = [v46 countByEnumeratingWithState:&v91 objects:v104 count:16];
      BOOL v55 = 0;
      id v4 = v51;
      char v43 = v85;
      unsigned int v45 = v83;
      if (v48) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v55 = 0;
    uint64_t v49 = 0;
  }
LABEL_73:

  [(CXCallUpdate *)v5 setMediaPlaybackOnExternalDevice:v49];
  if ((v43 & 1) == 0 && (v55 | [v4 isScreenEnabled]) != 1)
  {
    [(CXCallUpdate *)v5 setMixesVoiceWithMedia:0];
    goto LABEL_78;
  }
  if (!v45)
  {
LABEL_78:
    [(CXCallUpdate *)v5 setIgnoresBluetoothDeviceUID:0];
    goto LABEL_79;
  }
  [(CXCallUpdate *)v5 setMixesVoiceWithMedia:1];
LABEL_79:
  v58 = [v4 selectiveSharingSessionUUID];

  if (v58)
  {
    id v59 = objc_alloc_init((Class)CXScreenShareAttributes);
    v60 = [v4 selectiveSharingSessionUUID];
    [v59 setWindowUUID:v60];

    [(CXCallUpdate *)v5 setScreenShareAttributes:v59];
  }
  v61 = [v4 handoffContext];

  if (v61)
  {
    v62 = [v4 handoffContext];
    -[CXCallUpdate setPrefersToPlayDuringWombat:](v5, "setPrefersToPlayDuringWombat:", [v62 prefersToPlayDuringWombat]);
  }
  v86 = v5;
  id v63 = objc_alloc_init((Class)CXCallTokens);
  objc_msgSend(v63, "setCombinedAudioStreamToken:", objc_msgSend(v4, "avcSessionToken"));
  objc_msgSend(v63, "setUplinkStreamToken:", objc_msgSend(v4, "localCaptionToken"));
  id v64 = objc_alloc_init((Class)NSMutableDictionary);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v84 = v4;
  v65 = [v4 activeRemoteParticipants];
  id v66 = [v65 countByEnumeratingWithState:&v87 objects:v103 count:16];
  if (v66)
  {
    id v67 = v66;
    uint64_t v68 = *(void *)v88;
    do
    {
      for (m = 0; m != v67; m = (char *)m + 1)
      {
        if (*(void *)v88 != v68) {
          objc_enumerationMutation(v65);
        }
        v70 = *(void **)(*((void *)&v87 + 1) + 8 * (void)m);
        id v71 = objc_alloc((Class)NSUUID);
        v72 = [v70 avcIdentifier];
        id v73 = [v71 initWithUUIDString:v72];

        if (v73)
        {
          v74 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v70 captionsToken]);
          [v64 setObject:v74 forKeyedSubscript:v73];
        }
      }
      id v67 = [v65 countByEnumeratingWithState:&v87 objects:v103 count:16];
    }
    while (v67);
  }

  id v75 = [v64 copy];
  [v63 setStreamTokensByParticipantID:v75];

  v76 = [v64 allValues];
  v77 = [v76 firstObject];
  objc_msgSend(v63, "setDownlinkStreamToken:", objc_msgSend(v77, "integerValue"));

  v5 = v86;
  [(CXCallUpdate *)v86 setCallTokens:v63];
  id v4 = v84;
  v78 = [v84 report];
  v79 = [v78 conversationID];
  [(CXCallUpdate *)v86 setConversationID:v79];

LABEL_93:
  return v5;
}

- (int64_t)faceTimeTransportType
{
  v2 = [(CXCallUpdate *)self context];
  v3 = [v2 objectForKeyedSubscript:TUCallFaceTimeTransportTypeKey];

  if (v3) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)setFaceTimeTransportType:(int64_t)a3
{
  v5 = [(CXCallUpdate *)self context];
  if (v5)
  {
    id v6 = [(CXCallUpdate *)self context];
    id v8 = [v6 mutableCopy];
  }
  else
  {
    id v8 = +[NSMutableDictionary dictionary];
  }

  v7 = +[NSNumber numberWithInteger:a3];
  [v8 setObject:v7 forKeyedSubscript:TUCallFaceTimeTransportTypeKey];

  [(CXCallUpdate *)self setContext:v8];
}

- (BOOL)isRemoteMomentsAvailable
{
  v2 = [(CXCallUpdate *)self context];
  v3 = [v2 objectForKeyedSubscript:TUCallFaceTimeRemoteMomentsAvailableKey];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setRemoteMomentsAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CXCallUpdate *)self context];
  if (v5)
  {
    id v6 = [(CXCallUpdate *)self context];
    id v8 = [v6 mutableCopy];
  }
  else
  {
    id v8 = +[NSMutableDictionary dictionary];
  }

  v7 = +[NSNumber numberWithBool:v3];
  [v8 setObject:v7 forKeyedSubscript:TUCallFaceTimeRemoteMomentsAvailableKey];

  [(CXCallUpdate *)self setContext:v8];
}

- (NSString)localizedHandoffRecipientDeviceCategory
{
  v2 = [(CXCallUpdate *)self context];
  BOOL v3 = [v2 objectForKeyedSubscript:TUCallFaceTimeLocalizedHandoffRecipientDeviceCategoryKey];
  unsigned __int8 v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (void)setLocalizedHandoffRecipientDeviceCategory:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self context];
  if (v5)
  {
    id v6 = [(CXCallUpdate *)self context];
    id v7 = [v6 mutableCopy];
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionary];
  }

  [v7 setObject:v4 forKeyedSubscript:TUCallFaceTimeLocalizedHandoffRecipientDeviceCategoryKey];
  [(CXCallUpdate *)self setContext:v7];
}

- (NSNumber)handoffRecipientParticipant
{
  v2 = [(CXCallUpdate *)self context];
  BOOL v3 = [v2 objectForKeyedSubscript:TUCallFaceTimeHandoffRecipientParticipantKey];
  id v4 = [v3 numberValue];

  return (NSNumber *)v4;
}

- (void)setHandoffRecipientParticipant:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self context];
  if (v5)
  {
    id v6 = [(CXCallUpdate *)self context];
    id v7 = [v6 mutableCopy];
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionary];
  }

  [v7 setObject:v4 forKeyedSubscript:TUCallFaceTimeHandoffRecipientParticipantKey];
  [(CXCallUpdate *)self setContext:v7];
}

- (void)updatePropertiesForVideo:(BOOL)a3
{
  [(CXCallUpdate *)self setHasVideo:a3];
  if (!qword_10058C1F0)
  {
    id v4 = (void **)CUTWeakLinkSymbol();
    if (v4) {
      v5 = *v4;
    }
    else {
      v5 = 0;
    }
    objc_storeStrong((id *)&qword_10058C1F0, v5);
  }
  if (!qword_10058C1F8)
  {
    id v6 = (void **)CUTWeakLinkSymbol();
    if (v6) {
      id v7 = *v6;
    }
    else {
      id v7 = 0;
    }
    objc_storeStrong((id *)&qword_10058C1F8, v7);
  }
  unsigned int v8 = [(CXCallUpdate *)self hasVideo];
  id v9 = &qword_10058C1F8;
  if (!v8) {
    id v9 = &qword_10058C1F0;
  }
  uint64_t v10 = *v9;

  [(CXCallUpdate *)self setAudioMode:v10];
}

- (void)setConversationID:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self context];
  if (v5)
  {
    id v6 = [(CXCallUpdate *)self context];
    id v7 = [v6 mutableCopy];
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionary];
  }

  [v7 setObject:v4 forKeyedSubscript:@"conversationID"];
  [(CXCallUpdate *)self setContext:v7];
}

- (NSUUID)conversationID
{
  BOOL v3 = [(CXCallUpdate *)self context];

  if (v3)
  {
    id v4 = [(CXCallUpdate *)self context];
    v5 = [v4 objectForKeyedSubscript:@"conversationID"];
  }
  else
  {
    v5 = 0;
  }

  return (NSUUID *)v5;
}

- (CXCallUpdate)initWithTinCanIDSChat:(id)a3
{
  BOOL v3 = [(CXCallUpdate *)self initWithIDSChat:a3];
  id v4 = v3;
  if (v3)
  {
    [(CXCallUpdate *)v3 setHasVideo:0];
    [(CXCallUpdate *)v4 setSupportsHolding:0];
    [(CXCallUpdate *)v4 setMutuallyExclusiveCall:1];
  }
  return v4;
}

- (CXCallUpdate)initWithIDSChat:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self init];
  if (v5)
  {
    id v6 = [v4 handle];
    id v7 = +[CXHandle handleWithTUHandle:v6];
    [(CXCallUpdate *)v5 setRemoteHandle:v7];

    -[CXCallUpdate setHasVideo:](v5, "setHasVideo:", [v4 isVideo]);
    -[CXCallUpdate setSupportsHolding:](v5, "setSupportsHolding:", [v4 isVideo] ^ 1);
    [(CXCallUpdate *)v5 setSupportsGrouping:0];
    [(CXCallUpdate *)v5 setSupportsUngrouping:0];
    [(CXCallUpdate *)v5 setSupportsDTMF:0];
    [(CXCallUpdate *)v5 setSupportsRecording:0];
    [(CXCallUpdate *)v5 setIsUnderlyingLinksConnected:1];
    [(CXCallUpdate *)v5 setRequiresInCallSounds:1];
    -[CXCallUpdate setRemoteUplinkMuted:](v5, "setRemoteUplinkMuted:", [v4 isRemoteUplinkMuted]);
    unsigned int v8 = [v4 crossDeviceIdentifier];
    [(CXCallUpdate *)v5 setCrossDeviceIdentifier:v8];

    id v9 = [v4 remoteFromID];
    [(CXCallUpdate *)v5 setRemoteIDSDestination:v9];

    -[CXCallUpdate setInitialLinkType:](v5, "setInitialLinkType:", [v4 initialLinkType]);
    -[CXCallUpdate setInputAudioPowerSpectrumToken:](v5, "setInputAudioPowerSpectrumToken:", [v4 inputAudioPowerSpectrumToken]);
    -[CXCallUpdate setOutputAudioPowerSpectrumToken:](v5, "setOutputAudioPowerSpectrumToken:", [v4 outputAudioPowerSpectrumToken]);
    [(CXCallUpdate *)v5 setAudioInterruptionProvider:1];
    if ([v4 isVideo]) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 3;
    }
    [(CXCallUpdate *)v5 setAudioInterruptionOperationMode:v10];
    uint64_t v11 = [v4 localSenderIdentityUUID];
    [(CXCallUpdate *)v5 setLocalSenderIdentityUUID:v11];

    if (!qword_10058C368)
    {
      v12 = (void **)CUTWeakLinkSymbol();
      if (v12) {
        v13 = *v12;
      }
      else {
        v13 = 0;
      }
      objc_storeStrong((id *)&qword_10058C368, v13);
    }
    -[CXCallUpdate setAudioCategory:](v5, "setAudioCategory:");
    if (!qword_10058C370)
    {
      v14 = (void **)CUTWeakLinkSymbol();
      if (v14) {
        v15 = *v14;
      }
      else {
        v15 = 0;
      }
      objc_storeStrong((id *)&qword_10058C370, v15);
    }
    if (!qword_10058C378)
    {
      v16 = (void **)CUTWeakLinkSymbol();
      if (v16) {
        v17 = *v16;
      }
      else {
        v17 = 0;
      }
      objc_storeStrong((id *)&qword_10058C378, v17);
    }
    unsigned int v18 = [v4 isVideo];
    v19 = &qword_10058C378;
    if (!v18) {
      v19 = &qword_10058C370;
    }
    [(CXCallUpdate *)v5 setAudioMode:*v19];
  }

  return v5;
}

- (CXCallUpdate)initWithStartCallAction:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self init];
  if (v5)
  {
    id v6 = [v4 handle];
    [(CXCallUpdate *)v5 setRemoteHandle:v6];

    id v7 = [v4 handles];
    unsigned int v8 = +[NSSet setWithArray:v7];
    [(CXCallUpdate *)v5 setRemoteParticipantHandles:v8];

    -[CXCallUpdate setTTYType:](v5, "setTTYType:", [v4 ttyType]);
    -[CXCallUpdate setHasVideo:](v5, "setHasVideo:", [v4 isVideo]);
    -[CXCallUpdate setEmergency:](v5, "setEmergency:", [v4 isEmergency]);
    id v9 = [v4 localSenderIdentityUUID];
    [(CXCallUpdate *)v5 setLocalSenderIdentityUUID:v9];
  }
  return v5;
}

- (CXCallUpdate)initWithDialRequest:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self init];
  if (v5)
  {
    id v6 = [v4 handle];

    if (v6)
    {
      id v7 = [v4 handle];
      unsigned int v8 = +[CXHandle handleWithTUHandle:v7];
      [(CXCallUpdate *)v5 setRemoteHandle:v8];
    }
    id v9 = [v4 ttyType];
    if (v9 == (id)3) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == (id)2;
    }
    [(CXCallUpdate *)v5 setTTYType:v10];
    -[CXCallUpdate setEmergency:](v5, "setEmergency:", [v4 dialType] == (id)1);
    uint64_t v11 = [v4 localSenderIdentityUUID];
    [(CXCallUpdate *)v5 setLocalSenderIdentityUUID:v11];

    -[CXCallUpdate setShouldSuppressInCallUI:](v5, "setShouldSuppressInCallUI:", [v4 shouldSuppressInCallUI]);
  }

  return v5;
}

- (CXCallUpdate)initWithJoinConversationRequest:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self init];
  if (v5)
  {
    id v6 = [v4 remoteMembers];
    id v7 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    unsigned int v8 = [v4 remoteMembers];
    id v9 = [v8 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)v12) handle];
          v14 = +[CXHandle handleWithTUHandle:v13];
          [v7 addObject:v14];

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v10);
    }

    [(CXCallUpdate *)v5 setRemoteParticipantHandles:v7];
    v15 = [(CXCallUpdate *)v5 remoteParticipantHandles];
    v16 = [v15 anyObject];
    [(CXCallUpdate *)v5 setRemoteHandle:v16];

    v17 = [v4 otherInvitedHandles];
    unsigned int v18 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v17 count]);

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v19 = objc_msgSend(v4, "otherInvitedHandles", 0);
    id v20 = [v19 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        id v23 = 0;
        do
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          BOOL v24 = +[CXHandle handleWithTUHandle:*(void *)(*((void *)&v30 + 1) + 8 * (void)v23)];
          [v18 addObject:v24];

          id v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v21);
    }

    [(CXCallUpdate *)v5 setOtherInvitedHandles:v18];
    -[CXCallUpdate setHasVideo:](v5, "setHasVideo:", [v4 isVideo]);
    -[CXCallUpdate setShouldSuppressInCallUI:](v5, "setShouldSuppressInCallUI:", [v4 shouldSuppressInCallUI]);
    uint64_t v38 = TUConversationProviderIdentifierKey;
    v25 = [v4 provider];
    BOOL v26 = [v25 identifier];
    id v39 = v26;
    uint64_t v27 = 1;
    v28 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    [(CXCallUpdate *)v5 setContext:v28];

    if (([v4 requestToShareMyScreen] & 1) == 0)
    {
      if (![v4 requestToShareScreen])
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v27 = 2;
    }
    [(CXCallUpdate *)v5 setScreenSharingIntention:v27];
    goto LABEL_20;
  }
LABEL_21:

  return v5;
}

- (CXCallUpdate)sanitizedCallUpdate
{
  id v2 = [(CXCallUpdate *)self copy];
  id v26 = [v2 hasSet];
  int v27 = v3;
  if ((v26 & 4) != 0
    && ([v2 remoteHandle],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 value],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 length],
        v5,
        v4,
        !v6))
  {
    [v2 setRemoteHandle:0];
  }
  else
  {
    unint64_t v24 = (unint64_t)[v2 hasSet];
    int v25 = v7;
    if ((v24 & 0x80000000000) != 0)
    {
      unsigned int v8 = +[NSMutableSet set];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = objc_msgSend(v2, "remoteParticipantHandles", 0);
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            v15 = [v14 value];
            id v16 = [v15 length];

            if (v16) {
              [v8 addObject:v14];
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }

      id v17 = [v8 copy];
      [v2 setRemoteParticipantHandles:v17];
    }
  }

  return (CXCallUpdate *)v2;
}

- (NSString)remoteIDSDestination
{
  id v2 = [(CXCallUpdate *)self context];
  int v3 = [v2 objectForKeyedSubscript:TUCallFaceTimeRemoteIDSDestinationKey];

  return (NSString *)v3;
}

- (void)setRemoteIDSDestination:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallUpdate *)self context];
  if (v5)
  {
    id v6 = [(CXCallUpdate *)self context];
    id v7 = [v6 mutableCopy];
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionary];
  }

  [v7 setObject:v4 forKeyedSubscript:TUCallFaceTimeRemoteIDSDestinationKey];
  [(CXCallUpdate *)self setContext:v7];
}

- (unint64_t)initialLinkType
{
  id v2 = [(CXCallUpdate *)self context];
  int v3 = [v2 objectForKeyedSubscript:@"CSDIDSInitialLinkTypeKey"];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (void)setInitialLinkType:(unint64_t)a3
{
  v5 = [(CXCallUpdate *)self context];
  if (v5)
  {
    id v6 = [(CXCallUpdate *)self context];
    id v8 = [v6 mutableCopy];
  }
  else
  {
    id v8 = +[NSMutableDictionary dictionary];
  }

  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v7 forKeyedSubscript:@"CSDIDSInitialLinkTypeKey"];

  [(CXCallUpdate *)self setContext:v8];
}

- (int64_t)inputAudioPowerSpectrumToken
{
  id v2 = [(CXCallUpdate *)self context];
  int v3 = [v2 objectForKeyedSubscript:@"CSDIDSInputAudioPowerSpectrumTokenKey"];
  id v4 = [v3 unsignedIntegerValue];

  return (int64_t)v4;
}

- (void)setInputAudioPowerSpectrumToken:(int64_t)a3
{
  v5 = [(CXCallUpdate *)self context];
  if (v5)
  {
    id v6 = [(CXCallUpdate *)self context];
    id v8 = [v6 mutableCopy];
  }
  else
  {
    id v8 = +[NSMutableDictionary dictionary];
  }

  id v7 = +[NSNumber numberWithInteger:a3];
  [v8 setObject:v7 forKeyedSubscript:@"CSDIDSInputAudioPowerSpectrumTokenKey"];

  [(CXCallUpdate *)self setContext:v8];
}

- (int64_t)outputAudioPowerSpectrumToken
{
  id v2 = [(CXCallUpdate *)self context];
  int v3 = [v2 objectForKeyedSubscript:@"CSDIDSOutputAudioPowerSpectrumTokenKey"];
  id v4 = [v3 unsignedIntegerValue];

  return (int64_t)v4;
}

- (void)setOutputAudioPowerSpectrumToken:(int64_t)a3
{
  v5 = [(CXCallUpdate *)self context];
  if (v5)
  {
    id v6 = [(CXCallUpdate *)self context];
    id v8 = [v6 mutableCopy];
  }
  else
  {
    id v8 = +[NSMutableDictionary dictionary];
  }

  id v7 = +[NSNumber numberWithInteger:a3];
  [v8 setObject:v7 forKeyedSubscript:@"CSDIDSOutputAudioPowerSpectrumTokenKey"];

  [(CXCallUpdate *)self setContext:v8];
}

- (TUMediaTokens)tuMediaTokens
{
  id v3 = objc_alloc_init((Class)TUMediaTokens);
  id v4 = [(CXCallUpdate *)self callTokens];
  objc_msgSend(v3, "setCombinedAudioStreamToken:", objc_msgSend(v4, "combinedAudioStreamToken"));

  v5 = [(CXCallUpdate *)self callTokens];
  objc_msgSend(v3, "setUplinkStreamToken:", objc_msgSend(v5, "uplinkStreamToken"));

  id v6 = [(CXCallUpdate *)self callTokens];
  objc_msgSend(v3, "setDownlinkStreamToken:", objc_msgSend(v6, "downlinkStreamToken"));

  return (TUMediaTokens *)v3;
}

- (id)tuCallUpdateWithProvider:(id)a3 withCallUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)TUCallUpdate) initWithProvider:v7];

  id v9 = [(CXCallUpdate *)self UUID];
  id v10 = [v9 copy];
  [v8 setUUID:v10];

  id v11 = [v6 copy];
  [v8 setCallUUID:v11];

  uint64_t v12 = [(CXCallUpdate *)self remoteHandle];
  v13 = [v12 tuHandle];
  id v14 = [v13 copy];
  [v8 setHandle:v14];

  v15 = (char *)[(CXCallUpdate *)self junkConfidence];
  if ((unint64_t)(v15 - 1) >= 3) {
    id v16 = 0;
  }
  else {
    id v16 = v15;
  }
  [v8 setJunkConfidence:v16];
  id v17 = [(CXCallUpdate *)self priority];
  if (v17 == (id)2) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = v17 == (id)1;
  }
  [v8 setPriority:v18];
  long long v19 = [(CXCallUpdate *)self remoteParticipantHandles];
  objc_msgSend(v8, "setRemoteParticipantCount:", objc_msgSend(v19, "count"));

  objc_msgSend(v8, "setHasVideo:", -[CXCallUpdate hasVideo](self, "hasVideo"));
  objc_msgSend(v8, "setConversation:", -[CXCallUpdate isConversation](self, "isConversation"));
  id v20 = [v8 copy];

  return v20;
}

@end