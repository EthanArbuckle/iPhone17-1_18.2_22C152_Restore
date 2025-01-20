@interface CSDMessagingRelayMessage
+ (Class)conversationMembersType;
+ (Class)conversationsType;
+ (Class)endpointIDSDestinationURIsType;
+ (Class)handlesToInviteType;
+ (Class)otherUniqueProxyIdentifiersType;
+ (Class)prominenceEntryType;
+ (Class)protoCallType;
+ (Class)providersType;
+ (Class)remoteParticipantHandlesType;
+ (Class)routesType;
- (BOOL)hasCallerNameFromNetwork;
- (BOOL)hasContactIdentifier;
- (BOOL)hasConversationUUIDString;
- (BOOL)hasDestinationID;
- (BOOL)hasDtmfUpdateDigits;
- (BOOL)hasDummyPayload;
- (BOOL)hasGroupUUIDString;
- (BOOL)hasHandle;
- (BOOL)hasHardPauseDigits;
- (BOOL)hasHardPauseState;
- (BOOL)hasHostCallCreationTime;
- (BOOL)hasImage;
- (BOOL)hasInviteData;
- (BOOL)hasIsoCountryCode;
- (BOOL)hasJoinConversationRequestURLString;
- (BOOL)hasLocalSenderIdentityAccountUUIDString;
- (BOOL)hasLocalSenderIdentityUUIDString;
- (BOOL)hasMessageSendTime;
- (BOOL)hasOBSOLETEConferenceIdentifier;
- (BOOL)hasProtoCallCapabilitiesState;
- (BOOL)hasProtoCallModel;
- (BOOL)hasProtoCallModelState;
- (BOOL)hasProtoCannotBeAnswered;
- (BOOL)hasProtoCannotRelayAudioOrVideoOnPairedDevice;
- (BOOL)hasProtoDTMFKey;
- (BOOL)hasProtoDisconnectedReason;
- (BOOL)hasProtoDisplayContext;
- (BOOL)hasProtoEmergency;
- (BOOL)hasProtoExpectedEndpointOnMessagingDevice;
- (BOOL)hasProtoFailureExpected;
- (BOOL)hasProtoNeedsManualInCallSounds;
- (BOOL)hasProtoOriginatingUIType;
- (BOOL)hasProtoPriority;
- (BOOL)hasProtoProtocolVersion;
- (BOOL)hasProtoProvider;
- (BOOL)hasProtoRemoteUplinkMuted;
- (BOOL)hasProtoSOS;
- (BOOL)hasProtoService;
- (BOOL)hasProtoShouldSuppressRingtone;
- (BOOL)hasProtoSoundRegion;
- (BOOL)hasProtoSupportsDTMFUpdates;
- (BOOL)hasProtoSupportsEmergencyFallback;
- (BOOL)hasProtoSupportsTTYWithVoice;
- (BOOL)hasProtoTTYType;
- (BOOL)hasProtoUplinkMuted;
- (BOOL)hasProtoVideo;
- (BOOL)hasProtoVoicemail;
- (BOOL)hasProtoWantsHoldMusic;
- (BOOL)hasReceivedMessageType;
- (BOOL)hasRequestActionType;
- (BOOL)hasRoute;
- (BOOL)hasSenderIDSIdentifier;
- (BOOL)hasSourceIdentifier;
- (BOOL)hasSystemVolume;
- (BOOL)hasType;
- (BOOL)hasUniqueProxyIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVideo;
- (BOOL)protoCannotBeAnswered;
- (BOOL)protoCannotRelayAudioOrVideoOnPairedDevice;
- (BOOL)protoEmergency;
- (BOOL)protoExpectedEndpointOnMessagingDevice;
- (BOOL)protoFailureExpected;
- (BOOL)protoNeedsManualInCallSounds;
- (BOOL)protoRemoteUplinkMuted;
- (BOOL)protoSOS;
- (BOOL)protoShouldSuppressRingtone;
- (BOOL)protoSupportsDTMFUpdates;
- (BOOL)protoSupportsEmergencyFallback;
- (BOOL)protoSupportsTTYWithVoice;
- (BOOL)protoUplinkMuted;
- (BOOL)protoVideo;
- (BOOL)protoVoicemail;
- (BOOL)protoWantsHoldMusic;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingAVConferenceInviteData)inviteData;
- (CSDMessagingCallCapabilitiesState)protoCallCapabilitiesState;
- (CSDMessagingCallDisplayContext)protoDisplayContext;
- (CSDMessagingCallModel)protoCallModel;
- (CSDMessagingCallModelState)protoCallModelState;
- (CSDMessagingCallProvider)protoProvider;
- (CSDMessagingHandle)handle;
- (CSDMessagingRelayMessage)initWithDictionary:(id)a3;
- (CSDMessagingRelayMessage)initWithType:(int)a3;
- (CSDMessagingRelayMessage)initWithType:(int)a3 uniqueProxyIdentifier:(id)a4;
- (CSDMessagingRoute)route;
- (IDSDestination)endpointIDSDestination;
- (NSArray)tuProviders;
- (NSData)dummyPayload;
- (NSData)image;
- (NSData)protoDTMFKey;
- (NSMutableArray)conversationMembers;
- (NSMutableArray)conversations;
- (NSMutableArray)endpointIDSDestinationURIs;
- (NSMutableArray)handlesToInvites;
- (NSMutableArray)otherUniqueProxyIdentifiers;
- (NSMutableArray)prominenceEntrys;
- (NSMutableArray)protoCalls;
- (NSMutableArray)providers;
- (NSMutableArray)remoteParticipantHandles;
- (NSMutableArray)routes;
- (NSSet)remoteParticipantTUHandles;
- (NSString)callerNameFromNetwork;
- (NSString)contactIdentifier;
- (NSString)conversationUUIDString;
- (NSString)destinationID;
- (NSString)dtmfUpdateDigits;
- (NSString)groupUUIDString;
- (NSString)hardPauseDigits;
- (NSString)isoCountryCode;
- (NSString)joinConversationRequestURLString;
- (NSString)localSenderIdentityAccountUUIDString;
- (NSString)localSenderIdentityUUIDString;
- (NSString)oBSOLETEConferenceIdentifier;
- (NSString)receivedMessageTypeString;
- (NSString)senderIDSIdentifier;
- (NSString)sourceIdentifier;
- (NSString)typeString;
- (NSString)uniqueProxyIdentifier;
- (NSUUID)localSenderIdentityAccountUUID;
- (NSUUID)localSenderIdentityUUID;
- (TUCallCapabilitiesState)callCapabilitiesState;
- (TUCallDisplayContext)displayContext;
- (TUCallModel)callModel;
- (TUCallProvider)tuProvider;
- (TUDialRequest)dialRequest;
- (TUHandle)tuHandle;
- (TUJoinConversationRequest)joinConversationRequest;
- (double)hostCallCreationTime;
- (double)messageSendTime;
- (float)systemVolume;
- (id)conversationMembersAtIndex:(unint64_t)a3;
- (id)conversationsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endpointIDSDestinationURIsAtIndex:(unint64_t)a3;
- (id)handlesToInviteAtIndex:(unint64_t)a3;
- (id)initAddRemoteMemberMessageWithMembers:(id)a3 otherInvitedHandles:(id)a4 conversationWithUUID:(id)a5;
- (id)initBuzzMemberMessage:(id)a3 conversationUUID:(id)a4;
- (id)otherUniqueProxyIdentifiersAtIndex:(unint64_t)a3;
- (id)prominenceEntryAtIndex:(unint64_t)a3;
- (id)protoCallAtIndex:(unint64_t)a3;
- (id)providersAtIndex:(unint64_t)a3;
- (id)receivedMessageTypeAsString:(int)a3;
- (id)remoteParticipantHandlesAtIndex:(unint64_t)a3;
- (id)requestActionTypeAsString:(int)a3;
- (id)routesAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsReceivedMessageType:(id)a3;
- (int)StringAsRequestActionType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)receivedMessageType;
- (int)requestActionType;
- (int)type;
- (int64_t)priority;
- (int64_t)soundRegion;
- (unint64_t)conversationMembersCount;
- (unint64_t)conversationsCount;
- (unint64_t)endpointIDSDestinationURIsCount;
- (unint64_t)handlesToInvitesCount;
- (unint64_t)hash;
- (unint64_t)otherUniqueProxyIdentifiersCount;
- (unint64_t)prominenceEntrysCount;
- (unint64_t)protoCallsCount;
- (unint64_t)providersCount;
- (unint64_t)remoteParticipantHandlesCount;
- (unint64_t)routesCount;
- (unsigned)DTMFKey;
- (unsigned)hardPauseState;
- (unsigned)protoDisconnectedReason;
- (unsigned)protoOriginatingUIType;
- (unsigned)protoPriority;
- (unsigned)protoProtocolVersion;
- (unsigned)protoService;
- (unsigned)protoSoundRegion;
- (unsigned)protoTTYType;
- (void)addCall:(id)a3;
- (void)addConversationMembers:(id)a3;
- (void)addConversations:(id)a3;
- (void)addEndpointIDSDestinationURIs:(id)a3;
- (void)addHandlesToInvite:(id)a3;
- (void)addOtherUniqueProxyIdentifiers:(id)a3;
- (void)addProminenceEntry:(id)a3;
- (void)addProtoCall:(id)a3;
- (void)addProtocolVersion;
- (void)addProviders:(id)a3;
- (void)addRemoteParticipantHandles:(id)a3;
- (void)addRoutes:(id)a3;
- (void)clearConversationMembers;
- (void)clearConversations;
- (void)clearEndpointIDSDestinationURIs;
- (void)clearHandlesToInvites;
- (void)clearOtherUniqueProxyIdentifiers;
- (void)clearProminenceEntrys;
- (void)clearProtoCalls;
- (void)clearProviders;
- (void)clearRemoteParticipantHandles;
- (void)clearRoutes;
- (void)copyTo:(id)a3;
- (void)customizeForProtocolVersion:(int)a3;
- (void)mergeFrom:(id)a3;
- (void)setCallCapabilitiesState:(id)a3;
- (void)setCallModel:(id)a3;
- (void)setCallerNameFromNetwork:(id)a3;
- (void)setCannotBeAnswered:(BOOL)a3;
- (void)setCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setConversationMembers:(id)a3;
- (void)setConversationUUIDString:(id)a3;
- (void)setConversations:(id)a3;
- (void)setDTMFKey:(unsigned __int8)a3;
- (void)setDestinationID:(id)a3;
- (void)setDisconnectedReason:(int)a3;
- (void)setDisplayContext:(id)a3;
- (void)setDtmfUpdateDigits:(id)a3;
- (void)setDummyPayload:(id)a3;
- (void)setEmergency:(BOOL)a3;
- (void)setEndpointIDSDestination:(id)a3;
- (void)setEndpointIDSDestinationURIs:(id)a3;
- (void)setExpectedEndpointOnMessagingDevice:(BOOL)a3;
- (void)setFailureExpected:(BOOL)a3;
- (void)setGroupUUIDString:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHandlesToInvites:(id)a3;
- (void)setHardPauseDigits:(id)a3;
- (void)setHardPauseDigitsState:(int)a3;
- (void)setHardPauseState:(unsigned int)a3;
- (void)setHasHardPauseState:(BOOL)a3;
- (void)setHasHostCallCreationTime:(BOOL)a3;
- (void)setHasMessageSendTime:(BOOL)a3;
- (void)setHasProtoCannotBeAnswered:(BOOL)a3;
- (void)setHasProtoCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3;
- (void)setHasProtoDisconnectedReason:(BOOL)a3;
- (void)setHasProtoEmergency:(BOOL)a3;
- (void)setHasProtoExpectedEndpointOnMessagingDevice:(BOOL)a3;
- (void)setHasProtoFailureExpected:(BOOL)a3;
- (void)setHasProtoNeedsManualInCallSounds:(BOOL)a3;
- (void)setHasProtoOriginatingUIType:(BOOL)a3;
- (void)setHasProtoPriority:(BOOL)a3;
- (void)setHasProtoProtocolVersion:(BOOL)a3;
- (void)setHasProtoRemoteUplinkMuted:(BOOL)a3;
- (void)setHasProtoSOS:(BOOL)a3;
- (void)setHasProtoService:(BOOL)a3;
- (void)setHasProtoShouldSuppressRingtone:(BOOL)a3;
- (void)setHasProtoSoundRegion:(BOOL)a3;
- (void)setHasProtoSupportsDTMFUpdates:(BOOL)a3;
- (void)setHasProtoSupportsEmergencyFallback:(BOOL)a3;
- (void)setHasProtoSupportsTTYWithVoice:(BOOL)a3;
- (void)setHasProtoTTYType:(BOOL)a3;
- (void)setHasProtoUplinkMuted:(BOOL)a3;
- (void)setHasProtoVideo:(BOOL)a3;
- (void)setHasProtoVoicemail:(BOOL)a3;
- (void)setHasProtoWantsHoldMusic:(BOOL)a3;
- (void)setHasReceivedMessageType:(BOOL)a3;
- (void)setHasRequestActionType:(BOOL)a3;
- (void)setHasSystemVolume:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHostCallCreationTime:(double)a3;
- (void)setImage:(id)a3;
- (void)setInviteData:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setJoinConversationRequestURLString:(id)a3;
- (void)setLocalSenderIdentityAccountUUID:(id)a3;
- (void)setLocalSenderIdentityAccountUUIDString:(id)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setLocalSenderIdentityUUIDString:(id)a3;
- (void)setMessageSendTime:(double)a3;
- (void)setNeedsManualInCallSounds:(BOOL)a3;
- (void)setOBSOLETEConferenceIdentifier:(id)a3;
- (void)setOriginatingUIType:(int)a3;
- (void)setOtherUniqueProxyIdentifiers:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProminenceEntrys:(id)a3;
- (void)setProtoCallCapabilitiesState:(id)a3;
- (void)setProtoCallModel:(id)a3;
- (void)setProtoCallModelState:(id)a3;
- (void)setProtoCalls:(id)a3;
- (void)setProtoCannotBeAnswered:(BOOL)a3;
- (void)setProtoCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3;
- (void)setProtoDTMFKey:(id)a3;
- (void)setProtoDisconnectedReason:(unsigned int)a3;
- (void)setProtoDisplayContext:(id)a3;
- (void)setProtoEmergency:(BOOL)a3;
- (void)setProtoExpectedEndpointOnMessagingDevice:(BOOL)a3;
- (void)setProtoFailureExpected:(BOOL)a3;
- (void)setProtoNeedsManualInCallSounds:(BOOL)a3;
- (void)setProtoOriginatingUIType:(unsigned int)a3;
- (void)setProtoPriority:(unsigned int)a3;
- (void)setProtoProtocolVersion:(unsigned int)a3;
- (void)setProtoProvider:(id)a3;
- (void)setProtoRemoteUplinkMuted:(BOOL)a3;
- (void)setProtoSOS:(BOOL)a3;
- (void)setProtoService:(unsigned int)a3;
- (void)setProtoShouldSuppressRingtone:(BOOL)a3;
- (void)setProtoSoundRegion:(unsigned int)a3;
- (void)setProtoSupportsDTMFUpdates:(BOOL)a3;
- (void)setProtoSupportsEmergencyFallback:(BOOL)a3;
- (void)setProtoSupportsTTYWithVoice:(BOOL)a3;
- (void)setProtoTTYType:(unsigned int)a3;
- (void)setProtoUplinkMuted:(BOOL)a3;
- (void)setProtoVideo:(BOOL)a3;
- (void)setProtoVoicemail:(BOOL)a3;
- (void)setProtoWantsHoldMusic:(BOOL)a3;
- (void)setProtocolVersion:(int)a3;
- (void)setProviders:(id)a3;
- (void)setReceivedMessageType:(int)a3;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setRemoteParticipantTUHandles:(id)a3;
- (void)setRemoteUplinkMuted:(BOOL)a3;
- (void)setRequestActionType:(int)a3;
- (void)setRoute:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setSOS:(BOOL)a3;
- (void)setSenderIDSIdentifier:(id)a3;
- (void)setService:(int)a3;
- (void)setShouldSuppressRingtone:(BOOL)a3;
- (void)setSoundRegion:(int64_t)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setSupportsDTMFUpdates:(BOOL)a3;
- (void)setSupportsEmergencyFallback:(BOOL)a3;
- (void)setSupportsTTYWithVoice:(BOOL)a3;
- (void)setSystemVolume:(float)a3;
- (void)setTtyType:(int)a3;
- (void)setTuHandle:(id)a3;
- (void)setTuProvider:(id)a3;
- (void)setTuProvider:(id)a3 isVideo:(BOOL)a4;
- (void)setTuProviders:(id)a3;
- (void)setType:(int)a3;
- (void)setUniqueProxyIdentifier:(id)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVoicemail:(BOOL)a3;
- (void)setWantsHoldMusic:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingRelayMessage

- (CSDMessagingRelayMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"type"];
  v6 = -[CSDMessagingRelayMessage initWithType:](self, "initWithType:", [v5 intValue]);

  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000532C0;
    v8[3] = &unk_100505808;
    v9 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  return v6;
}

- (CSDMessagingRelayMessage)initWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)CSDMessagingRelayMessage;
  id v4 = [(CSDMessagingRelayMessage *)&v10 init];
  v5 = v4;
  if (v4)
  {
    [(CSDMessagingRelayMessage *)v4 setType:v3];
    v6 = +[CSDRelayIDSService sharedInstance];
    unsigned int v7 = [v6 pairedDeviceExists];

    if (v7)
    {
      v8 = +[NSDate date];
      [v8 timeIntervalSince1970];
      -[CSDMessagingRelayMessage setMessageSendTime:](v5, "setMessageSendTime:");
    }
  }
  return v5;
}

- (CSDMessagingRelayMessage)initWithType:(int)a3 uniqueProxyIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  unsigned int v7 = [(CSDMessagingRelayMessage *)self initWithType:v4];
  v8 = v7;
  if (v7) {
    [(CSDMessagingRelayMessage *)v7 setUniqueProxyIdentifier:v6];
  }

  return v8;
}

- (id)initAddRemoteMemberMessageWithMembers:(id)a3 otherInvitedHandles:(id)a4 conversationWithUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CSDMessagingRelayMessage *)self initWithType:52];
  if (v11)
  {
    v12 = +[NSMutableArray array];
    [(CSDMessagingRelayMessage *)v11 setConversationMembers:v12];

    v13 = +[NSMutableArray array];
    [(CSDMessagingRelayMessage *)v11 setHandlesToInvites:v13];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v32 = v8;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v18);
          v20 = [(CSDMessagingRelayMessage *)v11 conversationMembers];
          v21 = +[CSDMessagingConversationMember memberWithTUConversationMember:v19];
          [v20 addObject:v21];

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v16);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v22 = v9;
    id v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        v26 = 0;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v26);
          v28 = [(CSDMessagingRelayMessage *)v11 handlesToInvites];
          v29 = +[CSDMessagingHandle handleWithTUHandle:v27];
          [v28 addObject:v29];

          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        id v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v24);
    }

    v30 = [v10 UUIDString];
    [(CSDMessagingRelayMessage *)v11 setConversationUUIDString:v30];

    id v8 = v32;
  }

  return v11;
}

- (id)initBuzzMemberMessage:(id)a3 conversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDMessagingRelayMessage *)self initWithType:51];
  if (v8)
  {
    id v9 = +[CSDMessagingConversationMember memberWithTUConversationMember:v6];
    id v10 = +[NSMutableArray arrayWithObject:v9];
    [(CSDMessagingRelayMessage *)v8 setConversationMembers:v10];

    v11 = [v7 UUIDString];
    [(CSDMessagingRelayMessage *)v8 setConversationUUIDString:v11];
  }
  return v8;
}

- (NSString)typeString
{
  uint64_t v2 = [(CSDMessagingRelayMessage *)self type];
  if (v2 >= 0x39)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", v2];
  }
  else
  {
    uint64_t v3 = off_100505828[(int)v2];
  }

  return (NSString *)v3;
}

- (NSString)receivedMessageTypeString
{
  uint64_t v2 = [(CSDMessagingRelayMessage *)self receivedMessageType];
  if (v2 >= 0x39)
  {
    uint64_t v3 = +[NSString stringWithFormat:@"(unknown: %i)", v2];
  }
  else
  {
    uint64_t v3 = off_100505828[(int)v2];
  }

  return (NSString *)v3;
}

- (TUDialRequest)dialRequest
{
  if ([(CSDMessagingRelayMessage *)self type] != 2)
  {
    id v5 = 0;
    goto LABEL_15;
  }
  id v3 = objc_alloc((Class)TUDialRequest);
  uint64_t v4 = [(CSDMessagingRelayMessage *)self tuProvider];
  id v5 = [v3 initWithProvider:v4];

  id v6 = [(CSDMessagingRelayMessage *)self tuHandle];
  [v5 setHandle:v6];

  [v5 setVideo:0];
  id v7 = [(CSDMessagingRelayMessage *)self sourceIdentifier];
  [v5 setAudioSourceIdentifier:v7];

  if ([(CSDMessagingRelayMessage *)self isVoicemail])
  {
    uint64_t v8 = 2;
LABEL_7:
    [v5 setDialType:v8];
    goto LABEL_8;
  }
  if ([(CSDMessagingRelayMessage *)self isEmergency])
  {
    uint64_t v8 = 1;
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v5, "setSOS:", -[CSDMessagingRelayMessage isSOS](self, "isSOS"));
  id v9 = [(CSDMessagingRelayMessage *)self uniqueProxyIdentifier];
  [v5 setUniqueProxyIdentifier:v9];

  [v5 setEndpointOnCurrentDevice:0];
  id v10 = [(CSDMessagingRelayMessage *)self localSenderIdentityUUID];
  [v5 setLocalSenderIdentityUUID:v10];

  v11 = [(CSDMessagingRelayMessage *)self localSenderIdentityAccountUUID];
  [v5 setLocalSenderIdentityAccountUUID:v11];

  v12 = [(CSDMessagingRelayMessage *)self localSenderIdentityUUID];
  if (v12)
  {
  }
  else
  {
    v13 = [(CSDMessagingRelayMessage *)self localSenderIdentityAccountUUID];

    if (v13)
    {
      id v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(CSDMessagingRelayMessage *)self localSenderIdentityAccountUUID];
        int v24 = 138412290;
        uint64_t v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Fetching localSenderIdenity for localSenderIdentityAccountUUID %@", (uint8_t *)&v24, 0xCu);
      }
      id v16 = +[TUCallCenter sharedInstance];
      uint64_t v17 = [v16 providerManager];
      v18 = [v17 telephonyProvider];
      uint64_t v19 = [(CSDMessagingRelayMessage *)self localSenderIdentityAccountUUID];
      v20 = [v18 senderIdentityForAccountUUID:v19];
      v21 = [v20 UUID];
      [v5 setLocalSenderIdentityUUID:v21];
    }
  }
  [(CSDMessagingRelayMessage *)self ttyType];
  [v5 setTtyType:TUDialRequestTTYTypeForTUCallTTYType()];
  objc_msgSend(v5, "setOriginatingUIType:", -[CSDMessagingRelayMessage originatingUIType](self, "originatingUIType"));
  id v22 = [(CSDMessagingRelayMessage *)self contactIdentifier];
  [v5 setContactIdentifier:v22];

LABEL_15:

  return (TUDialRequest *)v5;
}

- (TUJoinConversationRequest)joinConversationRequest
{
  if ([(CSDMessagingRelayMessage *)self type] == 50)
  {
    id v3 = [(CSDMessagingRelayMessage *)self joinConversationRequestURLString];
    uint64_t v4 = +[NSURL URLWithString:v3];

    id v5 = [objc_alloc((Class)TUJoinConversationRequest) initWithURL:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (TUJoinConversationRequest *)v5;
}

- (void)setService:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoService])
  {
    [(CSDMessagingRelayMessage *)self setProtoService:v3];
  }
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoWantsHoldMusic])
  {
    [(CSDMessagingRelayMessage *)self setProtoWantsHoldMusic:v3];
  }
}

- (void)setDisconnectedReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoDisconnectedReason])
  {
    [(CSDMessagingRelayMessage *)self setProtoDisconnectedReason:v3];
  }
}

- (void)setCannotBeAnswered:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoCannotBeAnswered])
  {
    [(CSDMessagingRelayMessage *)self setProtoCannotBeAnswered:v3];
  }
}

- (unsigned)DTMFKey
{
  id v2 = [(CSDMessagingRelayMessage *)self protoDTMFKey];
  unsigned __int8 v3 = *(unsigned char *)[v2 bytes];

  return v3;
}

- (void)setDTMFKey:(unsigned __int8)a3
{
  unsigned __int8 v5 = a3;
  uint64_t v4 = +[NSData dataWithBytes:&v5 length:1];
  [(CSDMessagingRelayMessage *)self setProtoDTMFKey:v4];
}

- (void)setVoicemail:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoVoicemail])
  {
    [(CSDMessagingRelayMessage *)self setProtoVoicemail:v3];
  }
}

- (void)setHardPauseDigitsState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingRelayMessage *)self hardPauseState])
  {
    [(CSDMessagingRelayMessage *)self setHardPauseState:v3];
  }
}

- (void)setProtocolVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoProtocolVersion])
  {
    [(CSDMessagingRelayMessage *)self setProtoProtocolVersion:v3];
  }
}

- (void)addProtocolVersion
{
}

- (void)customizeForProtocolVersion:(int)a3
{
  unsigned __int8 v5 = [(CSDMessagingRelayMessage *)self hardPauseDigits];

  if (a3 < 2 && v5)
  {
    id v6 = [(CSDMessagingRelayMessage *)self hardPauseDigits];
    id v7 = TUHardPauseDigitsDisplayString();

    uint64_t v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(CSDMessagingRelayMessage *)self hardPauseDigits];
      int v12 = 138412802;
      int64_t v13 = (int64_t)v9;
      __int16 v14 = 2112;
      uint64_t v15 = (uint64_t)v7;
      __int16 v16 = 1024;
      int v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Replacing hardPauseDigits '%@' with '%@' since protocolVersion is %d", (uint8_t *)&v12, 0x1Cu);
    }
    [(CSDMessagingRelayMessage *)self setHardPauseDigits:v7];
  }
  else if (a3 > 2)
  {
    return;
  }
  if (([(CSDMessagingRelayMessage *)self soundRegion] & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = [(CSDMessagingRelayMessage *)self soundRegion];
      int v12 = 134218496;
      int64_t v13 = v11;
      __int16 v14 = 2048;
      uint64_t v15 = 1;
      __int16 v16 = 1024;
      int v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Replacing soundRegion %ld with %ld since protocolVersion is %d", (uint8_t *)&v12, 0x1Cu);
    }

    [(CSDMessagingRelayMessage *)self setSoundRegion:1];
  }
}

- (void)setShouldSuppressRingtone:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoShouldSuppressRingtone])
  {
    [(CSDMessagingRelayMessage *)self setProtoShouldSuppressRingtone:v3];
  }
}

- (void)setNeedsManualInCallSounds:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoNeedsManualInCallSounds])
  {
    [(CSDMessagingRelayMessage *)self setProtoNeedsManualInCallSounds:v3];
  }
}

- (void)setCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    || [(CSDMessagingRelayMessage *)self protoCannotRelayAudioOrVideoOnPairedDevice])
  {
    [(CSDMessagingRelayMessage *)self setProtoCannotRelayAudioOrVideoOnPairedDevice:v3];
  }
}

- (void)setExpectedEndpointOnMessagingDevice:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    || [(CSDMessagingRelayMessage *)self protoExpectedEndpointOnMessagingDevice])
  {
    [(CSDMessagingRelayMessage *)self setProtoExpectedEndpointOnMessagingDevice:v3];
  }
}

- (int64_t)soundRegion
{
  return self->_protoSoundRegion;
}

- (void)setSoundRegion:(int64_t)a3
{
  if (self->_protoSoundRegion != a3) {
    self->_protoSoundRegion = a3;
  }
}

- (void)setCallCapabilitiesState:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [[CSDMessagingCallCapabilitiesState alloc] initWithCallCapabilitiesState:v4];

  [(CSDMessagingRelayMessage *)self setProtoCallCapabilitiesState:v5];
}

- (TUCallCapabilitiesState)callCapabilitiesState
{
  id v2 = [(CSDMessagingRelayMessage *)self protoCallCapabilitiesState];
  BOOL v3 = [v2 state];

  return (TUCallCapabilitiesState *)v3;
}

- (void)setEmergency:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoEmergency])
  {
    [(CSDMessagingRelayMessage *)self setProtoEmergency:v3];
  }
}

- (void)setFailureExpected:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoFailureExpected])
  {
    [(CSDMessagingRelayMessage *)self setProtoFailureExpected:v3];
  }
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoSupportsEmergencyFallback])
  {
    [(CSDMessagingRelayMessage *)self setProtoSupportsEmergencyFallback:v3];
  }
}

- (void)setSOS:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoSOS])
  {
    [(CSDMessagingRelayMessage *)self setProtoSOS:v3];
  }
}

- (void)setSupportsDTMFUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoSupportsDTMFUpdates])
  {
    [(CSDMessagingRelayMessage *)self setProtoSupportsDTMFUpdates:v3];
  }
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoUplinkMuted])
  {
    [(CSDMessagingRelayMessage *)self setProtoUplinkMuted:v3];
  }
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoRemoteUplinkMuted])
  {
    [(CSDMessagingRelayMessage *)self setProtoRemoteUplinkMuted:v3];
  }
}

- (TUCallModel)callModel
{
  id v3 = objc_alloc_init((Class)TUCallModel);
  id v4 = [(CSDMessagingRelayMessage *)self protoCallModel];
  if (v4)
  {
    unsigned __int8 v5 = [(CSDMessagingRelayMessage *)self protoCallModel];
    id v6 = [v5 supportsHolding];
  }
  else
  {
    unsigned __int8 v5 = [(CSDMessagingRelayMessage *)self protoCallModelState];
    id v6 = [v5 holdAllowed];
  }
  [v3 setSupportsHolding:v6];

  id v7 = [(CSDMessagingRelayMessage *)self protoCallModel];
  if (v7)
  {
    uint64_t v8 = [(CSDMessagingRelayMessage *)self protoCallModel];
    id v9 = [v8 supportsGrouping];
  }
  else
  {
    uint64_t v8 = [(CSDMessagingRelayMessage *)self protoCallModelState];
    id v9 = [v8 mergeable];
  }
  [v3 setSupportsGrouping:v9];

  id v10 = [(CSDMessagingRelayMessage *)self protoCallModel];
  if (v10)
  {
    int64_t v11 = [(CSDMessagingRelayMessage *)self protoCallModel];
    id v12 = [v11 supportsUngrouping];
  }
  else
  {
    int64_t v11 = [(CSDMessagingRelayMessage *)self protoCallModelState];
    id v12 = [v11 takingCallsPrivateAllowed];
  }
  [v3 setSupportsUngrouping:v12];

  int64_t v13 = [(CSDMessagingRelayMessage *)self protoCallModel];
  if (v13)
  {
    __int16 v14 = [(CSDMessagingRelayMessage *)self protoCallModel];
    unint64_t v15 = (unint64_t)[v14 supportsUnambiguousMultiPartyState];
  }
  else
  {
    __int16 v14 = [(CSDMessagingRelayMessage *)self protoCallModelState];
    unint64_t v15 = [v14 ambiguityState] == 0;
  }
  [v3 setSupportsUnambiguousMultiPartyState:v15];

  __int16 v16 = [(CSDMessagingRelayMessage *)self protoCallModel];
  if (v16)
  {
    int v17 = [(CSDMessagingRelayMessage *)self protoCallModel];
    id v18 = [v17 supportsAddCall];
  }
  else
  {
    int v17 = [(CSDMessagingRelayMessage *)self protoCallModelState];
    id v18 = [v17 addCallAllowed];
  }
  [v3 setSupportsAddCall:v18];

  uint64_t v19 = [(CSDMessagingRelayMessage *)self protoCallModel];
  if (v19)
  {
    v20 = [(CSDMessagingRelayMessage *)self protoCallModel];
    id v21 = [v20 supportsSendingToVoicemail];
  }
  else
  {
    v20 = [(CSDMessagingRelayMessage *)self protoCallModelState];
    id v21 = [v20 sendToVoicemailAllowed];
  }
  [v3 setSupportsSendingToVoicemail:v21];

  id v22 = [(CSDMessagingRelayMessage *)self protoCallModel];
  if (v22)
  {
    id v23 = [(CSDMessagingRelayMessage *)self protoCallModel];
    id v24 = [v23 supportsDTMF];
  }
  else
  {
    id v23 = [(CSDMessagingRelayMessage *)self protoCallModelState];
    id v24 = [v23 sendToVoicemailAllowed];
  }
  [v3 setSupportsDTMF:v24];

  return (TUCallModel *)v3;
}

- (void)setCallModel:(id)a3
{
  id v42 = a3;
  id v4 = [(CSDMessagingRelayMessage *)self protoCallModel];

  if (!v4)
  {
    unsigned __int8 v5 = objc_alloc_init(CSDMessagingCallModel);
    [(CSDMessagingRelayMessage *)self setProtoCallModel:v5];
  }
  id v6 = [v42 supportsHolding];
  id v7 = [(CSDMessagingRelayMessage *)self protoCallModel];
  [v7 setSupportsHolding:v6];

  id v8 = [v42 supportsGrouping];
  id v9 = [(CSDMessagingRelayMessage *)self protoCallModel];
  [v9 setSupportsGrouping:v8];

  id v10 = [v42 supportsUngrouping];
  int64_t v11 = [(CSDMessagingRelayMessage *)self protoCallModel];
  [v11 setSupportsUngrouping:v10];

  id v12 = [v42 supportsDTMF];
  int64_t v13 = [(CSDMessagingRelayMessage *)self protoCallModel];
  [v13 setSupportsDTMF:v12];

  id v14 = [v42 supportsUnambiguousMultiPartyState];
  unint64_t v15 = [(CSDMessagingRelayMessage *)self protoCallModel];
  [v15 setSupportsUnambiguousMultiPartyState:v14];

  id v16 = [v42 supportsAddCall];
  int v17 = [(CSDMessagingRelayMessage *)self protoCallModel];
  [v17 setSupportsAddCall:v16];

  id v18 = [v42 supportsSendingToVoicemail];
  uint64_t v19 = [(CSDMessagingRelayMessage *)self protoCallModel];
  [v19 setSupportsSendingToVoicemail:v18];

  v20 = [(CSDMessagingRelayMessage *)self protoCallModelState];

  if (!v20)
  {
    id v21 = objc_alloc_init(CSDMessagingCallModelState);
    [(CSDMessagingRelayMessage *)self setProtoCallModelState:v21];
  }
  uint64_t v22 = [v42 supportsUnambiguousMultiPartyState] ^ 1;
  id v23 = [(CSDMessagingRelayMessage *)self protoCallModelState];
  [v23 setAmbiguityState:v22];

  id v24 = [v42 supportsHolding];
  uint64_t v25 = [(CSDMessagingRelayMessage *)self protoCallModelState];
  [v25 setSwappable:v24];

  id v26 = [v42 supportsGrouping];
  uint64_t v27 = [(CSDMessagingRelayMessage *)self protoCallModelState];
  [v27 setMergeable:v26];

  id v28 = [v42 supportsHolding];
  v29 = [(CSDMessagingRelayMessage *)self protoCallModelState];
  [v29 setHoldAllowed:v28];

  id v30 = [v42 supportsAddCall];
  v31 = [(CSDMessagingRelayMessage *)self protoCallModelState];
  [v31 setAddCallAllowed:v30];

  id v32 = [v42 supportsUngrouping];
  long long v33 = [(CSDMessagingRelayMessage *)self protoCallModelState];
  [v33 setTakingCallsPrivateAllowed:v32];

  long long v34 = [(CSDMessagingRelayMessage *)self protoCallModelState];
  [v34 setHardPauseAvailable:1];

  id v35 = [v42 supportsUnambiguousMultiPartyState];
  long long v36 = [(CSDMessagingRelayMessage *)self protoCallModelState];
  [v36 setEndAndAnswerAllowed:v35];

  long long v37 = +[TUCallCenter sharedInstance];
  id v38 = [v37 isHoldAndAnswerAllowed];
  long long v39 = [(CSDMessagingRelayMessage *)self protoCallModelState];
  [v39 setHoldAndAnswerAllowed:v38];

  id v40 = [v42 supportsSendingToVoicemail];
  v41 = [(CSDMessagingRelayMessage *)self protoCallModelState];
  [v41 setSendToVoicemailAllowed:v40];
}

- (void)addCall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [[CSDMessagingCall alloc] initWithCall:v4];

  [(CSDMessagingRelayMessage *)self addProtoCall:v5];
}

- (void)setTuHandle:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 value];
  [(CSDMessagingRelayMessage *)self setDestinationID:v5];

  id v6 = +[CSDMessagingHandle handleWithTUHandle:v4];

  [(CSDMessagingRelayMessage *)self setHandle:v6];
}

- (TUHandle)tuHandle
{
  id v3 = [(CSDMessagingRelayMessage *)self handle];
  id v4 = [v3 tuHandle];

  if (!v4)
  {
    unsigned __int8 v5 = [(CSDMessagingRelayMessage *)self destinationID];
    if (v5)
    {
      id v4 = +[TUHandle normalizedHandleWithDestinationID:v5];
    }
    else
    {
      id v4 = 0;
    }
  }

  return (TUHandle *)v4;
}

- (NSArray)tuProviders
{
  id v3 = [(CSDMessagingRelayMessage *)self providers];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned __int8 v5 = [(CSDMessagingRelayMessage *)self providers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) provider];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return (NSArray *)v11;
}

- (void)setTuProviders:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        id v12 = [CSDMessagingCallProvider alloc];
        long long v13 = -[CSDMessagingCallProvider initWithProvider:](v12, "initWithProvider:", v11, (void)v14);
        [v5 addObject:v13];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(CSDMessagingRelayMessage *)self setProviders:v5];
}

- (TUCallProvider)tuProvider
{
  id v3 = [(CSDMessagingRelayMessage *)self protoProvider];
  id v4 = [v3 provider];

  if (!v4)
  {
    char v7 = 0;
    id v5 = objc_alloc_init((Class)TUCallProviderManager);
    id v4 = objc_msgSend(v5, "providerWithService:video:", -[CSDMessagingRelayMessage service](self, "service"), &v7);
  }

  return (TUCallProvider *)v4;
}

- (void)setTuProvider:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v4 = [[CSDMessagingCallProvider alloc] initWithProvider:v5];
    [(CSDMessagingRelayMessage *)self setProtoProvider:v4];
    [(CSDMessagingRelayMessage *)self setService:+[TUCallProviderManager serviceForProvider:v5 video:[(CSDMessagingRelayMessage *)self isVideo]]];
  }
  else
  {
    [(CSDMessagingRelayMessage *)self setProtoProvider:0];
  }
}

- (BOOL)isVideo
{
  char v6 = 0;
  if ([(CSDMessagingRelayMessage *)self hasProtoVideo])
  {
    return [(CSDMessagingRelayMessage *)self protoVideo];
  }
  else
  {
    id v3 = objc_alloc_init((Class)TUCallProviderManager);
    id v4 = objc_msgSend(v3, "providerWithService:video:", -[CSDMessagingRelayMessage service](self, "service"), &v6);

    return v6 != 0;
  }
}

- (void)setVideo:(BOOL)a3
{
  BOOL v3 = a3;
  -[CSDMessagingRelayMessage setProtoVideo:](self, "setProtoVideo:");
  id v5 = [(CSDMessagingRelayMessage *)self tuProvider];
  [(CSDMessagingRelayMessage *)self setService:+[TUCallProviderManager serviceForProvider:v5 video:v3]];
}

- (void)setTuProvider:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v8)
  {
    char v6 = [[CSDMessagingCallProvider alloc] initWithProvider:v8];
    [(CSDMessagingRelayMessage *)self setProtoProvider:v6];
    char v7 = [(CSDMessagingRelayMessage *)self tuProvider];
    [(CSDMessagingRelayMessage *)self setService:+[TUCallProviderManager serviceForProvider:v7 video:v4]];
  }
  else
  {
    [(CSDMessagingRelayMessage *)self setProtoProvider:0];
  }
  [(CSDMessagingRelayMessage *)self setProtoVideo:v4];
}

- (TUCallDisplayContext)displayContext
{
  id v2 = [(CSDMessagingRelayMessage *)self protoDisplayContext];
  BOOL v3 = [v2 displayContext];

  return (TUCallDisplayContext *)v3;
}

- (void)setDisplayContext:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[CSDMessagingCallDisplayContext alloc] initWithCallDisplayContext:v4];
  }
  else
  {
    id v5 = 0;
  }
  [(CSDMessagingRelayMessage *)self setProtoDisplayContext:v5];
}

- (IDSDestination)endpointIDSDestination
{
  BOOL v3 = [(CSDMessagingRelayMessage *)self endpointIDSDestinationURIs];
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CSDMessagingRelayMessage *)self endpointIDSDestinationURIs];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[IDSDestination destinationWithURI:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    uint64_t v11 = +[IDSDestination destinationWithDestinations:v4];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return (IDSDestination *)v11;
}

- (void)setEndpointIDSDestination:(id)a3
{
  id v6 = [a3 destinationURIs];
  id v4 = [v6 allObjects];
  id v5 = [v4 mutableCopy];
  [(CSDMessagingRelayMessage *)self setEndpointIDSDestinationURIs:v5];
}

- (NSUUID)localSenderIdentityUUID
{
  BOOL v3 = [(CSDMessagingRelayMessage *)self localSenderIdentityUUIDString];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    id v5 = [(CSDMessagingRelayMessage *)self localSenderIdentityUUIDString];
    id v6 = [v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(CSDMessagingRelayMessage *)self setLocalSenderIdentityUUIDString:v4];
}

- (NSUUID)localSenderIdentityAccountUUID
{
  BOOL v3 = [(CSDMessagingRelayMessage *)self localSenderIdentityAccountUUIDString];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    id v5 = [(CSDMessagingRelayMessage *)self localSenderIdentityAccountUUIDString];
    id v6 = [v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setLocalSenderIdentityAccountUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(CSDMessagingRelayMessage *)self setLocalSenderIdentityAccountUUIDString:v4];
}

- (NSSet)remoteParticipantTUHandles
{
  BOOL v3 = [(CSDMessagingRelayMessage *)self remoteParticipantHandles];
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CSDMessagingRelayMessage *)self remoteParticipantHandles];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) tuHandle];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return (NSSet *)v11;
}

- (void)setRemoteParticipantTUHandles:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = +[CSDMessagingHandle handleWithTUHandle:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        if (v9) {
          [(CSDMessagingRelayMessage *)self addRemoteParticipantHandles:v9];
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setTtyType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoTTYType])
  {
    [(CSDMessagingRelayMessage *)self setProtoTTYType:v3];
  }
}

- (void)setSupportsTTYWithVoice:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoSupportsTTYWithVoice])
  {
    [(CSDMessagingRelayMessage *)self setProtoSupportsTTYWithVoice:v3];
  }
}

- (int64_t)priority
{
  return self->_protoPriority;
}

- (void)setPriority:(int64_t)a3
{
  if (self->_protoPriority != a3) {
    -[CSDMessagingRelayMessage setProtoPriority:](self, "setProtoPriority:");
  }
}

- (void)setOriginatingUIType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingRelayMessage *)self protoOriginatingUIType])
  {
    [(CSDMessagingRelayMessage *)self setProtoOriginatingUIType:v3];
  }
}

- (int)type
{
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0x39)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_100506120[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoAction"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IncomingCall"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DialCall"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CallDialed"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AnswerCall"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CallAnsweredElsewhere"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CallDisconnected"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PlayDTMFToneForKey"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CallConnected"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"DisconnectCall"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PullRelayingCalls"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HoldCall"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"UnholdCall"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"GroupCall"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"UngroupCall"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ResetWantsHoldMusic"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SwapCalls"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"UpdateCallModel"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"DeviceUnavailable"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"EndActiveAndAnswer"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"EndHeldAndAnswer"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"DisconnectCurrentCallAndActivateHeld"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"DisconnectAllCalls"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ResetState"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"HardPauseDigitsAvailability"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"SendHardPauseDigits"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"UpdateRemoteCallState"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"SuppressRingtone"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"RequestCallContext"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"CallStartedConnecting"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"PushHostedCalls"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"PullHostedCalls"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"PushRelayingCalls"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"UpdateCallContext"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"NeedsManualInCallSoundsChange"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"InvitationSent"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"HoldActiveAndAnswer"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"UpdateCallDisplayContext"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"SetUplinkMuted"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"UpdateRemoteUplinkMuted"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"UpdateSystemVolume"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"UpdateSupportsTTYWithVoice"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"SetTTYType"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"RequestAction"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"UpdateRoutes"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"PickRoute"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"DowngradeToAudio"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"UpdateFailureExpected"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"UpdateSupportsEmergencyFallback"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"Conversation"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"JoinConversation"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"BuzzMember"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"AddMemberAndOtherHandle"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"Prominence"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"UpdateConversations"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"UpdateSupportsDTMFUpdates"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"ReceivedDTMFUpdate"])
  {
    int v4 = 56;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasUniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier != 0;
}

- (BOOL)hasDestinationID
{
  return self->_destinationID != 0;
}

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0;
}

- (BOOL)hasProtoCallModelState
{
  return self->_protoCallModelState != 0;
}

- (void)setProtoService:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_protoService = a3;
}

- (void)setHasProtoService:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasProtoService
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setProtoWantsHoldMusic:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_protoWantsHoldMusic = a3;
}

- (void)setHasProtoWantsHoldMusic:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasProtoWantsHoldMusic
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setProtoCannotBeAnswered:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_protoCannotBeAnswered = a3;
}

- (void)setHasProtoCannotBeAnswered:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasProtoCannotBeAnswered
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasProtoDTMFKey
{
  return self->_protoDTMFKey != 0;
}

- (void)setProtoDisconnectedReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_protoDisconnectedReason = a3;
}

- (void)setHasProtoDisconnectedReason:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasProtoDisconnectedReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasOBSOLETEConferenceIdentifier
{
  return self->_oBSOLETEConferenceIdentifier != 0;
}

- (void)setProtoVoicemail:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_protoVoicemail = a3;
}

- (void)setHasProtoVoicemail:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasProtoVoicemail
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasCallerNameFromNetwork
{
  return self->_callerNameFromNetwork != 0;
}

- (void)clearProtoCalls
{
}

- (void)addProtoCall:(id)a3
{
  id v4 = a3;
  protoCalls = self->_protoCalls;
  id v8 = v4;
  if (!protoCalls)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_protoCalls;
    self->_protoCalls = v6;

    id v4 = v8;
    protoCalls = self->_protoCalls;
  }
  [(NSMutableArray *)protoCalls addObject:v4];
}

- (unint64_t)protoCallsCount
{
  return (unint64_t)[(NSMutableArray *)self->_protoCalls count];
}

- (id)protoCallAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_protoCalls objectAtIndex:a3];
}

+ (Class)protoCallType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasHardPauseDigits
{
  return self->_hardPauseDigits != 0;
}

- (void)setHardPauseState:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_hardPauseState = a3;
}

- (void)setHasHardPauseState:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasHardPauseState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)receivedMessageType
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_receivedMessageType;
  }
  else {
    return 0;
  }
}

- (void)setReceivedMessageType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_receivedMessageType = a3;
}

- (void)setHasReceivedMessageType:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasReceivedMessageType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)receivedMessageTypeAsString:(int)a3
{
  if (a3 >= 0x39)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_100506120[a3];
  }

  return v3;
}

- (int)StringAsReceivedMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoAction"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IncomingCall"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DialCall"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CallDialed"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AnswerCall"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CallAnsweredElsewhere"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CallDisconnected"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PlayDTMFToneForKey"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CallConnected"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"DisconnectCall"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PullRelayingCalls"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HoldCall"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"UnholdCall"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"GroupCall"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"UngroupCall"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ResetWantsHoldMusic"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SwapCalls"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"UpdateCallModel"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"DeviceUnavailable"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"EndActiveAndAnswer"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"EndHeldAndAnswer"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"DisconnectCurrentCallAndActivateHeld"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"DisconnectAllCalls"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ResetState"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"HardPauseDigitsAvailability"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"SendHardPauseDigits"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"UpdateRemoteCallState"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"SuppressRingtone"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"RequestCallContext"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"CallStartedConnecting"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"PushHostedCalls"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"PullHostedCalls"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"PushRelayingCalls"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"UpdateCallContext"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"NeedsManualInCallSoundsChange"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"InvitationSent"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"HoldActiveAndAnswer"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"UpdateCallDisplayContext"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"SetUplinkMuted"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"UpdateRemoteUplinkMuted"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"UpdateSystemVolume"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"UpdateSupportsTTYWithVoice"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"SetTTYType"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"RequestAction"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"UpdateRoutes"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"PickRoute"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"DowngradeToAudio"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"UpdateFailureExpected"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"UpdateSupportsEmergencyFallback"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"Conversation"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"JoinConversation"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"BuzzMember"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"AddMemberAndOtherHandle"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"Prominence"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"UpdateConversations"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"UpdateSupportsDTMFUpdates"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"ReceivedDTMFUpdate"])
  {
    int v4 = 56;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setProtoProtocolVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_protoProtocolVersion = a3;
}

- (void)setHasProtoProtocolVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasProtoProtocolVersion
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setProtoShouldSuppressRingtone:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_protoShouldSuppressRingtone = a3;
}

- (void)setHasProtoShouldSuppressRingtone:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasProtoShouldSuppressRingtone
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasDummyPayload
{
  return self->_dummyPayload != 0;
}

- (void)setHostCallCreationTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_hostCallCreationTime = a3;
}

- (void)setHasHostCallCreationTime:(BOOL)a3
{
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasHostCallCreationTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setMessageSendTime:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_messageSendTime = a3;
}

- (void)setHasMessageSendTime:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasMessageSendTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setProtoNeedsManualInCallSounds:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_protoNeedsManualInCallSounds = a3;
}

- (void)setHasProtoNeedsManualInCallSounds:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasProtoNeedsManualInCallSounds
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setProtoCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_protoCannotRelayAudioOrVideoOnPairedDevice = a3;
}

- (void)setHasProtoCannotRelayAudioOrVideoOnPairedDevice:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasProtoCannotRelayAudioOrVideoOnPairedDevice
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setProtoExpectedEndpointOnMessagingDevice:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_protoExpectedEndpointOnMessagingDevice = a3;
}

- (void)setHasProtoExpectedEndpointOnMessagingDevice:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasProtoExpectedEndpointOnMessagingDevice
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (BOOL)hasProtoCallCapabilitiesState
{
  return self->_protoCallCapabilitiesState != 0;
}

- (void)setProtoSoundRegion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_protoSoundRegion = a3;
}

- (void)setHasProtoSoundRegion:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasProtoSoundRegion
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setProtoEmergency:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_protoEmergency = a3;
}

- (void)setHasProtoEmergency:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasProtoEmergency
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)clearOtherUniqueProxyIdentifiers
{
}

- (void)addOtherUniqueProxyIdentifiers:(id)a3
{
  id v4 = a3;
  otherUniqueProxyIdentifiers = self->_otherUniqueProxyIdentifiers;
  id v8 = v4;
  if (!otherUniqueProxyIdentifiers)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_otherUniqueProxyIdentifiers;
    self->_otherUniqueProxyIdentifiers = v6;

    id v4 = v8;
    otherUniqueProxyIdentifiers = self->_otherUniqueProxyIdentifiers;
  }
  [(NSMutableArray *)otherUniqueProxyIdentifiers addObject:v4];
}

- (unint64_t)otherUniqueProxyIdentifiersCount
{
  return (unint64_t)[(NSMutableArray *)self->_otherUniqueProxyIdentifiers count];
}

- (id)otherUniqueProxyIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_otherUniqueProxyIdentifiers objectAtIndex:a3];
}

+ (Class)otherUniqueProxyIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProtoCallModel
{
  return self->_protoCallModel != 0;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (void)setProtoSOS:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_protoSOS = a3;
}

- (void)setHasProtoSOS:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasProtoSOS
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)clearProviders
{
}

- (void)addProviders:(id)a3
{
  id v4 = a3;
  providers = self->_providers;
  id v8 = v4;
  if (!providers)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_providers;
    self->_providers = v6;

    id v4 = v8;
    providers = self->_providers;
  }
  [(NSMutableArray *)providers addObject:v4];
}

- (unint64_t)providersCount
{
  return (unint64_t)[(NSMutableArray *)self->_providers count];
}

- (id)providersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_providers objectAtIndex:a3];
}

+ (Class)providersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProtoDisplayContext
{
  return self->_protoDisplayContext != 0;
}

- (BOOL)hasInviteData
{
  return self->_inviteData != 0;
}

- (BOOL)hasProtoProvider
{
  return self->_protoProvider != 0;
}

- (void)setProtoVideo:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_protoVideo = a3;
}

- (void)setHasProtoVideo:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasProtoVideo
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setProtoUplinkMuted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_protoUplinkMuted = a3;
}

- (void)setHasProtoUplinkMuted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasProtoUplinkMuted
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setProtoRemoteUplinkMuted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_protoRemoteUplinkMuted = a3;
}

- (void)setHasProtoRemoteUplinkMuted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasProtoRemoteUplinkMuted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSystemVolume:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_systemVolume = a3;
}

- (void)setHasSystemVolume:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSystemVolume
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasLocalSenderIdentityUUIDString
{
  return self->_localSenderIdentityUUIDString != 0;
}

- (void)clearRemoteParticipantHandles
{
}

- (void)addRemoteParticipantHandles:(id)a3
{
  id v4 = a3;
  remoteParticipantHandles = self->_remoteParticipantHandles;
  id v8 = v4;
  if (!remoteParticipantHandles)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_remoteParticipantHandles;
    self->_remoteParticipantHandles = v6;

    id v4 = v8;
    remoteParticipantHandles = self->_remoteParticipantHandles;
  }
  [(NSMutableArray *)remoteParticipantHandles addObject:v4];
}

- (unint64_t)remoteParticipantHandlesCount
{
  return (unint64_t)[(NSMutableArray *)self->_remoteParticipantHandles count];
}

- (id)remoteParticipantHandlesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_remoteParticipantHandles objectAtIndex:a3];
}

+ (Class)remoteParticipantHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLocalSenderIdentityAccountUUIDString
{
  return self->_localSenderIdentityAccountUUIDString != 0;
}

- (void)setProtoTTYType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_protoTTYType = a3;
}

- (void)setHasProtoTTYType:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasProtoTTYType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setProtoSupportsTTYWithVoice:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_protoSupportsTTYWithVoice = a3;
}

- (void)setHasProtoSupportsTTYWithVoice:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasProtoSupportsTTYWithVoice
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (int)requestActionType
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_requestActionType;
  }
  else {
    return 0;
  }
}

- (void)setRequestActionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_requestActionType = a3;
}

- (void)setHasRequestActionType:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRequestActionType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)requestActionTypeAsString:(int)a3
{
  if (a3 >= 0x39)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_100506120[a3];
  }

  return v3;
}

- (int)StringAsRequestActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoAction"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IncomingCall"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DialCall"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CallDialed"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AnswerCall"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CallAnsweredElsewhere"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CallDisconnected"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PlayDTMFToneForKey"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CallConnected"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"DisconnectCall"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PullRelayingCalls"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HoldCall"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"UnholdCall"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"GroupCall"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"UngroupCall"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ResetWantsHoldMusic"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SwapCalls"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"UpdateCallModel"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"DeviceUnavailable"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"EndActiveAndAnswer"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"EndHeldAndAnswer"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"DisconnectCurrentCallAndActivateHeld"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"DisconnectAllCalls"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ResetState"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"HardPauseDigitsAvailability"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"SendHardPauseDigits"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"UpdateRemoteCallState"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"SuppressRingtone"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"RequestCallContext"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"CallStartedConnecting"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"PushHostedCalls"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"PullHostedCalls"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"PushRelayingCalls"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"UpdateCallContext"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"NeedsManualInCallSoundsChange"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"InvitationSent"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"HoldActiveAndAnswer"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"UpdateCallDisplayContext"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"SetUplinkMuted"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"UpdateRemoteUplinkMuted"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"UpdateSystemVolume"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"UpdateSupportsTTYWithVoice"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"SetTTYType"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"RequestAction"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"UpdateRoutes"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"PickRoute"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"DowngradeToAudio"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"UpdateFailureExpected"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"UpdateSupportsEmergencyFallback"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"Conversation"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"JoinConversation"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"BuzzMember"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"AddMemberAndOtherHandle"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"Prominence"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"UpdateConversations"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"UpdateSupportsDTMFUpdates"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"ReceivedDTMFUpdate"])
  {
    int v4 = 56;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearRoutes
{
}

- (void)addRoutes:(id)a3
{
  id v4 = a3;
  routes = self->_routes;
  id v8 = v4;
  if (!routes)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_routes;
    self->_routes = v6;

    id v4 = v8;
    routes = self->_routes;
  }
  [(NSMutableArray *)routes addObject:v4];
}

- (unint64_t)routesCount
{
  return (unint64_t)[(NSMutableArray *)self->_routes count];
}

- (id)routesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_routes objectAtIndex:a3];
}

+ (Class)routesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRoute
{
  return self->_route != 0;
}

- (void)clearEndpointIDSDestinationURIs
{
}

- (void)addEndpointIDSDestinationURIs:(id)a3
{
  id v4 = a3;
  endpointIDSDestinationURIs = self->_endpointIDSDestinationURIs;
  id v8 = v4;
  if (!endpointIDSDestinationURIs)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_endpointIDSDestinationURIs;
    self->_endpointIDSDestinationURIs = v6;

    id v4 = v8;
    endpointIDSDestinationURIs = self->_endpointIDSDestinationURIs;
  }
  [(NSMutableArray *)endpointIDSDestinationURIs addObject:v4];
}

- (unint64_t)endpointIDSDestinationURIsCount
{
  return (unint64_t)[(NSMutableArray *)self->_endpointIDSDestinationURIs count];
}

- (id)endpointIDSDestinationURIsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_endpointIDSDestinationURIs objectAtIndex:a3];
}

+ (Class)endpointIDSDestinationURIsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (void)setProtoPriority:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_protoPriority = a3;
}

- (void)setHasProtoPriority:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasProtoPriority
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setProtoOriginatingUIType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_protoOriginatingUIType = a3;
}

- (void)setHasProtoOriginatingUIType:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasProtoOriginatingUIType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setProtoFailureExpected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_protoFailureExpected = a3;
}

- (void)setHasProtoFailureExpected:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasProtoFailureExpected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setProtoSupportsEmergencyFallback:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_protoSupportsEmergencyFallback = a3;
}

- (void)setHasProtoSupportsEmergencyFallback:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasProtoSupportsEmergencyFallback
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (BOOL)hasGroupUUIDString
{
  return self->_groupUUIDString != 0;
}

- (void)clearConversations
{
}

- (void)addConversations:(id)a3
{
  id v4 = a3;
  conversations = self->_conversations;
  id v8 = v4;
  if (!conversations)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_conversations;
    self->_conversations = v6;

    id v4 = v8;
    conversations = self->_conversations;
  }
  [(NSMutableArray *)conversations addObject:v4];
}

- (unint64_t)conversationsCount
{
  return (unint64_t)[(NSMutableArray *)self->_conversations count];
}

- (id)conversationsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_conversations objectAtIndex:a3];
}

+ (Class)conversationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasJoinConversationRequestURLString
{
  return self->_joinConversationRequestURLString != 0;
}

- (BOOL)hasConversationUUIDString
{
  return self->_conversationUUIDString != 0;
}

- (void)clearConversationMembers
{
}

- (void)addConversationMembers:(id)a3
{
  id v4 = a3;
  conversationMembers = self->_conversationMembers;
  id v8 = v4;
  if (!conversationMembers)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_conversationMembers;
    self->_conversationMembers = v6;

    id v4 = v8;
    conversationMembers = self->_conversationMembers;
  }
  [(NSMutableArray *)conversationMembers addObject:v4];
}

- (unint64_t)conversationMembersCount
{
  return (unint64_t)[(NSMutableArray *)self->_conversationMembers count];
}

- (id)conversationMembersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_conversationMembers objectAtIndex:a3];
}

+ (Class)conversationMembersType
{
  return (Class)objc_opt_class();
}

- (void)clearHandlesToInvites
{
}

- (void)addHandlesToInvite:(id)a3
{
  id v4 = a3;
  handlesToInvites = self->_handlesToInvites;
  id v8 = v4;
  if (!handlesToInvites)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_handlesToInvites;
    self->_handlesToInvites = v6;

    id v4 = v8;
    handlesToInvites = self->_handlesToInvites;
  }
  [(NSMutableArray *)handlesToInvites addObject:v4];
}

- (unint64_t)handlesToInvitesCount
{
  return (unint64_t)[(NSMutableArray *)self->_handlesToInvites count];
}

- (id)handlesToInviteAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_handlesToInvites objectAtIndex:a3];
}

+ (Class)handlesToInviteType
{
  return (Class)objc_opt_class();
}

- (void)clearProminenceEntrys
{
}

- (void)addProminenceEntry:(id)a3
{
  id v4 = a3;
  prominenceEntrys = self->_prominenceEntrys;
  id v8 = v4;
  if (!prominenceEntrys)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_prominenceEntrys;
    self->_prominenceEntrys = v6;

    id v4 = v8;
    prominenceEntrys = self->_prominenceEntrys;
  }
  [(NSMutableArray *)prominenceEntrys addObject:v4];
}

- (unint64_t)prominenceEntrysCount
{
  return (unint64_t)[(NSMutableArray *)self->_prominenceEntrys count];
}

- (id)prominenceEntryAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_prominenceEntrys objectAtIndex:a3];
}

+ (Class)prominenceEntryType
{
  return (Class)objc_opt_class();
}

- (void)setProtoSupportsDTMFUpdates:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_protoSupportsDTMFUpdates = a3;
}

- (void)setHasProtoSupportsDTMFUpdates:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D957FAF0D32A69CAB50B82F534D16002)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasProtoSupportsDTMFUpdates
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasDtmfUpdateDigits
{
  return self->_dtmfUpdateDigits != 0;
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (BOOL)hasSenderIDSIdentifier
{
  return self->_senderIDSIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingRelayMessage;
  int v3 = [(CSDMessagingRelayMessage *)&v7 description];
  id v4 = [(CSDMessagingRelayMessage *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 0x39)
    {
      id v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      id v5 = off_100506120[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  if (uniqueProxyIdentifier) {
    [v3 setObject:uniqueProxyIdentifier forKey:@"uniqueProxyIdentifier"];
  }
  destinationID = self->_destinationID;
  if (destinationID) {
    [v3 setObject:destinationID forKey:@"destinationID"];
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier) {
    [v3 setObject:sourceIdentifier forKey:@"sourceIdentifier"];
  }
  protoCallModelState = self->_protoCallModelState;
  if (protoCallModelState)
  {
    long long v10 = [(CSDMessagingCallModelState *)protoCallModelState dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"protoCallModelState"];
  }
  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    v69 = +[NSNumber numberWithUnsignedInt:self->_protoService];
    [v3 setObject:v69 forKey:@"protoService"];

    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_16;
  }
  v70 = +[NSNumber numberWithBool:self->_protoWantsHoldMusic];
  [v3 setObject:v70 forKey:@"protoWantsHoldMusic"];

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_17:
    long long v12 = +[NSNumber numberWithBool:self->_protoCannotBeAnswered];
    [v3 setObject:v12 forKey:@"protoCannotBeAnswered"];
  }
LABEL_18:
  protoDTMFKey = self->_protoDTMFKey;
  if (protoDTMFKey) {
    [v3 setObject:protoDTMFKey forKey:@"protoDTMFKey"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    long long v14 = +[NSNumber numberWithUnsignedInt:self->_protoDisconnectedReason];
    [v3 setObject:v14 forKey:@"protoDisconnectedReason"];
  }
  oBSOLETEConferenceIdentifier = self->_oBSOLETEConferenceIdentifier;
  if (oBSOLETEConferenceIdentifier) {
    [v3 setObject:oBSOLETEConferenceIdentifier forKey:@"OBSOLETE_conferenceIdentifier"];
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x10) != 0)
  {
    long long v16 = +[NSNumber numberWithBool:self->_protoVoicemail];
    [v3 setObject:v16 forKey:@"protoVoicemail"];
  }
  callerNameFromNetwork = self->_callerNameFromNetwork;
  if (callerNameFromNetwork) {
    [v3 setObject:callerNameFromNetwork forKey:@"callerNameFromNetwork"];
  }
  if ([(NSMutableArray *)self->_protoCalls count])
  {
    id v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_protoCalls, "count"));
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    uint64_t v19 = self->_protoCalls;
    id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v167 objects:v178 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v168;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v168 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = [*(id *)(*((void *)&v167 + 1) + 8 * i) dictionaryRepresentation];
          [v18 addObject:v24];
        }
        id v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v167 objects:v178 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"protoCall"];
  }
  hardPauseDigits = self->_hardPauseDigits;
  if (hardPauseDigits) {
    [v3 setObject:hardPauseDigits forKey:@"hardPauseDigits"];
  }
  $D957FAF0D32A69CAB50B82F534D16002 v26 = self->_has;
  if ((*(unsigned char *)&v26 & 4) != 0)
  {
    v71 = +[NSNumber numberWithUnsignedInt:self->_hardPauseState];
    [v3 setObject:v71 forKey:@"hardPauseState"];

    $D957FAF0D32A69CAB50B82F534D16002 v26 = self->_has;
    if ((*(_WORD *)&v26 & 0x400) == 0)
    {
LABEL_41:
      if ((*(unsigned char *)&v26 & 0x40) == 0) {
        goto LABEL_42;
      }
      goto LABEL_126;
    }
  }
  else if ((*(_WORD *)&v26 & 0x400) == 0)
  {
    goto LABEL_41;
  }
  uint64_t receivedMessageType = self->_receivedMessageType;
  if (receivedMessageType >= 0x39)
  {
    v73 = +[NSString stringWithFormat:@"(unknown: %i)", self->_receivedMessageType];
  }
  else
  {
    v73 = off_100506120[receivedMessageType];
  }
  [v3 setObject:v73 forKey:@"receivedMessageType"];

  $D957FAF0D32A69CAB50B82F534D16002 v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x40) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v26 & 0x400000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_126:
  v85 = +[NSNumber numberWithUnsignedInt:self->_protoProtocolVersion];
  [v3 setObject:v85 forKey:@"protoProtocolVersion"];

  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_43:
    uint64_t v27 = +[NSNumber numberWithBool:self->_protoShouldSuppressRingtone];
    [v3 setObject:v27 forKey:@"protoShouldSuppressRingtone"];
  }
LABEL_44:
  dummyPayload = self->_dummyPayload;
  if (dummyPayload) {
    [v3 setObject:dummyPayload forKey:@"dummyPayload"];
  }
  $D957FAF0D32A69CAB50B82F534D16002 v29 = self->_has;
  if (*(unsigned char *)&v29)
  {
    v74 = +[NSNumber numberWithDouble:self->_hostCallCreationTime];
    [v3 setObject:v74 forKey:@"hostCallCreationTime"];

    $D957FAF0D32A69CAB50B82F534D16002 v29 = self->_has;
    if ((*(unsigned char *)&v29 & 2) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v29 & 0x80000) == 0) {
        goto LABEL_49;
      }
      goto LABEL_113;
    }
  }
  else if ((*(unsigned char *)&v29 & 2) == 0)
  {
    goto LABEL_48;
  }
  v75 = +[NSNumber numberWithDouble:self->_messageSendTime];
  [v3 setObject:v75 forKey:@"messageSendTime"];

  $D957FAF0D32A69CAB50B82F534D16002 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x80000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v29 & 0x8000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_114;
  }
LABEL_113:
  v76 = +[NSNumber numberWithBool:self->_protoNeedsManualInCallSounds];
  [v3 setObject:v76 forKey:@"protoNeedsManualInCallSounds"];

  $D957FAF0D32A69CAB50B82F534D16002 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x8000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v29 & 0x20000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_114:
  v77 = +[NSNumber numberWithBool:self->_protoCannotRelayAudioOrVideoOnPairedDevice];
  [v3 setObject:v77 forKey:@"protoCannotRelayAudioOrVideoOnPairedDevice"];

  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_51:
    id v30 = +[NSNumber numberWithBool:self->_protoExpectedEndpointOnMessagingDevice];
    [v3 setObject:v30 forKey:@"protoExpectedEndpointOnMessagingDevice"];
  }
LABEL_52:
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier) {
    [v3 setObject:contactIdentifier forKey:@"contactIdentifier"];
  }
  protoCallCapabilitiesState = self->_protoCallCapabilitiesState;
  if (protoCallCapabilitiesState)
  {
    long long v33 = [(CSDMessagingCallCapabilitiesState *)protoCallCapabilitiesState dictionaryRepresentation];
    [v3 setObject:v33 forKey:@"protoCallCapabilitiesState"];
  }
  $D957FAF0D32A69CAB50B82F534D16002 v34 = self->_has;
  if ((*(_WORD *)&v34 & 0x100) != 0)
  {
    id v35 = +[NSNumber numberWithUnsignedInt:self->_protoSoundRegion];
    [v3 setObject:v35 forKey:@"protoSoundRegion"];

    $D957FAF0D32A69CAB50B82F534D16002 v34 = self->_has;
  }
  if ((*(_DWORD *)&v34 & 0x10000) != 0)
  {
    long long v36 = +[NSNumber numberWithBool:self->_protoEmergency];
    [v3 setObject:v36 forKey:@"protoEmergency"];
  }
  otherUniqueProxyIdentifiers = self->_otherUniqueProxyIdentifiers;
  if (otherUniqueProxyIdentifiers) {
    [v3 setObject:otherUniqueProxyIdentifiers forKey:@"otherUniqueProxyIdentifiers"];
  }
  protoCallModel = self->_protoCallModel;
  if (protoCallModel)
  {
    long long v39 = [(CSDMessagingCallModel *)protoCallModel dictionaryRepresentation];
    [v3 setObject:v39 forKey:@"protoCallModel"];
  }
  handle = self->_handle;
  if (handle)
  {
    v41 = [(CSDMessagingHandle *)handle dictionaryRepresentation];
    [v3 setObject:v41 forKey:@"handle"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    id v42 = +[NSNumber numberWithBool:self->_protoSOS];
    [v3 setObject:v42 forKey:@"protoSOS"];
  }
  if ([(NSMutableArray *)self->_providers count])
  {
    id v44 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_providers, "count"));
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    v45 = self->_providers;
    id v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v163 objects:v177 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v164;
      do
      {
        for (j = 0; j != v47; j = (char *)j + 1)
        {
          if (*(void *)v164 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = [*(id *)(*((void *)&v163 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v44 addObject:v50];
        }
        id v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v163 objects:v177 count:16];
      }
      while (v47);
    }

    [v3 setObject:v44 forKey:@"providers"];
  }
  protoDisplayContext = self->_protoDisplayContext;
  if (protoDisplayContext)
  {
    v52 = [(CSDMessagingCallDisplayContext *)protoDisplayContext dictionaryRepresentation];
    [v3 setObject:v52 forKey:@"protoDisplayContext"];
  }
  inviteData = self->_inviteData;
  if (inviteData)
  {
    v54 = [(CSDMessagingAVConferenceInviteData *)inviteData dictionaryRepresentation];
    [v3 setObject:v54 forKey:@"inviteData"];
  }
  protoProvider = self->_protoProvider;
  if (protoProvider)
  {
    v56 = [(CSDMessagingCallProvider *)protoProvider dictionaryRepresentation];
    [v3 setObject:v56 forKey:@"protoProvider"];
  }
  $D957FAF0D32A69CAB50B82F534D16002 v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x8000000) != 0)
  {
    v78 = +[NSNumber numberWithBool:self->_protoVideo];
    [v3 setObject:v78 forKey:@"protoVideo"];

    $D957FAF0D32A69CAB50B82F534D16002 v57 = self->_has;
    if ((*(_DWORD *)&v57 & 0x4000000) == 0)
    {
LABEL_85:
      if ((*(_DWORD *)&v57 & 0x100000) == 0) {
        goto LABEL_86;
      }
      goto LABEL_118;
    }
  }
  else if ((*(_DWORD *)&v57 & 0x4000000) == 0)
  {
    goto LABEL_85;
  }
  v79 = +[NSNumber numberWithBool:self->_protoUplinkMuted];
  [v3 setObject:v79 forKey:@"protoUplinkMuted"];

  $D957FAF0D32A69CAB50B82F534D16002 v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x100000) == 0)
  {
LABEL_86:
    if ((*(_WORD *)&v57 & 0x1000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_118:
  v80 = +[NSNumber numberWithBool:self->_protoRemoteUplinkMuted];
  [v3 setObject:v80 forKey:@"protoRemoteUplinkMuted"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_87:
    *(float *)&double v43 = self->_systemVolume;
    v58 = +[NSNumber numberWithFloat:v43];
    [v3 setObject:v58 forKey:@"systemVolume"];
  }
LABEL_88:
  localSenderIdentityUUIDString = self->_localSenderIdentityUUIDString;
  if (localSenderIdentityUUIDString) {
    [v3 setObject:localSenderIdentityUUIDString forKey:@"localSenderIdentityUUIDString"];
  }
  if ([(NSMutableArray *)self->_remoteParticipantHandles count])
  {
    id v60 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_remoteParticipantHandles, "count"));
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    v61 = self->_remoteParticipantHandles;
    id v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v159 objects:v176 count:16];
    if (v62)
    {
      id v63 = v62;
      uint64_t v64 = *(void *)v160;
      do
      {
        for (k = 0; k != v63; k = (char *)k + 1)
        {
          if (*(void *)v160 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = [*(id *)(*((void *)&v159 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v60 addObject:v66];
        }
        id v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v159 objects:v176 count:16];
      }
      while (v63);
    }

    [v3 setObject:v60 forKey:@"remoteParticipantHandles"];
  }
  localSenderIdentityAccountUUIDString = self->_localSenderIdentityAccountUUIDString;
  if (localSenderIdentityAccountUUIDString) {
    [v3 setObject:localSenderIdentityAccountUUIDString forKey:@"localSenderIdentityAccountUUIDString"];
  }
  $D957FAF0D32A69CAB50B82F534D16002 v68 = self->_has;
  if ((*(_WORD *)&v68 & 0x200) != 0)
  {
    v81 = +[NSNumber numberWithUnsignedInt:self->_protoTTYType];
    [v3 setObject:v81 forKey:@"protoTTYType"];

    $D957FAF0D32A69CAB50B82F534D16002 v68 = self->_has;
    if ((*(_DWORD *)&v68 & 0x2000000) == 0)
    {
LABEL_103:
      if ((*(_WORD *)&v68 & 0x800) == 0) {
        goto LABEL_130;
      }
      goto LABEL_122;
    }
  }
  else if ((*(_DWORD *)&v68 & 0x2000000) == 0)
  {
    goto LABEL_103;
  }
  v82 = +[NSNumber numberWithBool:self->_protoSupportsTTYWithVoice];
  [v3 setObject:v82 forKey:@"protoSupportsTTYWithVoice"];

  if ((*(_DWORD *)&self->_has & 0x800) == 0) {
    goto LABEL_130;
  }
LABEL_122:
  uint64_t requestActionType = self->_requestActionType;
  if (requestActionType >= 0x39)
  {
    v84 = +[NSString stringWithFormat:@"(unknown: %i)", self->_requestActionType];
  }
  else
  {
    v84 = off_100506120[requestActionType];
  }
  [v3 setObject:v84 forKey:@"requestActionType"];

LABEL_130:
  if ([(NSMutableArray *)self->_routes count])
  {
    id v86 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_routes, "count"));
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    v87 = self->_routes;
    id v88 = [(NSMutableArray *)v87 countByEnumeratingWithState:&v155 objects:v175 count:16];
    if (v88)
    {
      id v89 = v88;
      uint64_t v90 = *(void *)v156;
      do
      {
        for (m = 0; m != v89; m = (char *)m + 1)
        {
          if (*(void *)v156 != v90) {
            objc_enumerationMutation(v87);
          }
          v92 = [*(id *)(*((void *)&v155 + 1) + 8 * (void)m) dictionaryRepresentation];
          [v86 addObject:v92];
        }
        id v89 = [(NSMutableArray *)v87 countByEnumeratingWithState:&v155 objects:v175 count:16];
      }
      while (v89);
    }

    [v3 setObject:v86 forKey:@"routes"];
  }
  route = self->_route;
  if (route)
  {
    v94 = [(CSDMessagingRoute *)route dictionaryRepresentation];
    [v3 setObject:v94 forKey:@"route"];
  }
  endpointIDSDestinationURIs = self->_endpointIDSDestinationURIs;
  if (endpointIDSDestinationURIs) {
    [v3 setObject:endpointIDSDestinationURIs forKey:@"endpointIDSDestinationURIs"];
  }
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode) {
    [v3 setObject:isoCountryCode forKey:@"isoCountryCode"];
  }
  $D957FAF0D32A69CAB50B82F534D16002 v97 = self->_has;
  if ((*(unsigned char *)&v97 & 0x20) != 0)
  {
    v136 = +[NSNumber numberWithUnsignedInt:self->_protoPriority];
    [v3 setObject:v136 forKey:@"protoPriority"];

    $D957FAF0D32A69CAB50B82F534D16002 v97 = self->_has;
    if ((*(unsigned char *)&v97 & 0x10) == 0)
    {
LABEL_147:
      if ((*(_DWORD *)&v97 & 0x40000) == 0) {
        goto LABEL_148;
      }
      goto LABEL_203;
    }
  }
  else if ((*(unsigned char *)&v97 & 0x10) == 0)
  {
    goto LABEL_147;
  }
  v137 = +[NSNumber numberWithUnsignedInt:self->_protoOriginatingUIType];
  [v3 setObject:v137 forKey:@"protoOriginatingUIType"];

  $D957FAF0D32A69CAB50B82F534D16002 v97 = self->_has;
  if ((*(_DWORD *)&v97 & 0x40000) == 0)
  {
LABEL_148:
    if ((*(_DWORD *)&v97 & 0x1000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_149;
  }
LABEL_203:
  v138 = +[NSNumber numberWithBool:self->_protoFailureExpected];
  [v3 setObject:v138 forKey:@"protoFailureExpected"];

  if ((*(_DWORD *)&self->_has & 0x1000000) != 0)
  {
LABEL_149:
    v98 = +[NSNumber numberWithBool:self->_protoSupportsEmergencyFallback];
    [v3 setObject:v98 forKey:@"protoSupportsEmergencyFallback"];
  }
LABEL_150:
  groupUUIDString = self->_groupUUIDString;
  if (groupUUIDString) {
    [v3 setObject:groupUUIDString forKey:@"groupUUIDString"];
  }
  if ([(NSMutableArray *)self->_conversations count])
  {
    id v100 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_conversations, "count"));
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    v101 = self->_conversations;
    id v102 = [(NSMutableArray *)v101 countByEnumeratingWithState:&v151 objects:v174 count:16];
    if (v102)
    {
      id v103 = v102;
      uint64_t v104 = *(void *)v152;
      do
      {
        for (n = 0; n != v103; n = (char *)n + 1)
        {
          if (*(void *)v152 != v104) {
            objc_enumerationMutation(v101);
          }
          v106 = [*(id *)(*((void *)&v151 + 1) + 8 * (void)n) dictionaryRepresentation];
          [v100 addObject:v106];
        }
        id v103 = [(NSMutableArray *)v101 countByEnumeratingWithState:&v151 objects:v174 count:16];
      }
      while (v103);
    }

    [v3 setObject:v100 forKey:@"conversations"];
  }
  joinConversationRequestURLString = self->_joinConversationRequestURLString;
  if (joinConversationRequestURLString) {
    [v3 setObject:joinConversationRequestURLString forKey:@"joinConversationRequestURLString"];
  }
  conversationUUIDString = self->_conversationUUIDString;
  if (conversationUUIDString) {
    [v3 setObject:conversationUUIDString forKey:@"conversationUUIDString"];
  }
  if ([(NSMutableArray *)self->_conversationMembers count])
  {
    id v109 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_conversationMembers, "count"));
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    v110 = self->_conversationMembers;
    id v111 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v147 objects:v173 count:16];
    if (v111)
    {
      id v112 = v111;
      uint64_t v113 = *(void *)v148;
      do
      {
        for (ii = 0; ii != v112; ii = (char *)ii + 1)
        {
          if (*(void *)v148 != v113) {
            objc_enumerationMutation(v110);
          }
          v115 = [*(id *)(*((void *)&v147 + 1) + 8 * (void)ii) dictionaryRepresentation];
          [v109 addObject:v115];
        }
        id v112 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v147 objects:v173 count:16];
      }
      while (v112);
    }

    [v3 setObject:v109 forKey:@"conversationMembers"];
  }
  if ([(NSMutableArray *)self->_handlesToInvites count])
  {
    id v116 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_handlesToInvites, "count"));
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    v117 = self->_handlesToInvites;
    id v118 = [(NSMutableArray *)v117 countByEnumeratingWithState:&v143 objects:v172 count:16];
    if (v118)
    {
      id v119 = v118;
      uint64_t v120 = *(void *)v144;
      do
      {
        for (jj = 0; jj != v119; jj = (char *)jj + 1)
        {
          if (*(void *)v144 != v120) {
            objc_enumerationMutation(v117);
          }
          v122 = [*(id *)(*((void *)&v143 + 1) + 8 * (void)jj) dictionaryRepresentation];
          [v116 addObject:v122];
        }
        id v119 = [(NSMutableArray *)v117 countByEnumeratingWithState:&v143 objects:v172 count:16];
      }
      while (v119);
    }

    [v3 setObject:v116 forKey:@"handlesToInvite"];
  }
  if ([(NSMutableArray *)self->_prominenceEntrys count])
  {
    id v123 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_prominenceEntrys, "count"));
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    v124 = self->_prominenceEntrys;
    id v125 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v139 objects:v171 count:16];
    if (v125)
    {
      id v126 = v125;
      uint64_t v127 = *(void *)v140;
      do
      {
        for (kk = 0; kk != v126; kk = (char *)kk + 1)
        {
          if (*(void *)v140 != v127) {
            objc_enumerationMutation(v124);
          }
          v129 = [*(id *)(*((void *)&v139 + 1) + 8 * (void)kk) dictionaryRepresentation];
          [v123 addObject:v129];
        }
        id v126 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v139 objects:v171 count:16];
      }
      while (v126);
    }

    [v3 setObject:v123 forKey:@"prominenceEntry"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    v130 = +[NSNumber numberWithBool:self->_protoSupportsDTMFUpdates];
    [v3 setObject:v130 forKey:@"protoSupportsDTMFUpdates"];
  }
  dtmfUpdateDigits = self->_dtmfUpdateDigits;
  if (dtmfUpdateDigits) {
    [v3 setObject:dtmfUpdateDigits forKey:@"dtmfUpdateDigits"];
  }
  image = self->_image;
  if (image) {
    [v3 setObject:image forKey:@"image"];
  }
  senderIDSIdentifier = self->_senderIDSIdentifier;
  if (senderIDSIdentifier) {
    [v3 setObject:senderIDSIdentifier forKey:@"senderIDSIdentifier"];
  }
  id v134 = v3;

  return v134;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008589C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_uniqueProxyIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_destinationID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_protoCallModelState) {
    PBDataWriterWriteSubmessage();
  }
  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_protoDTMFKey) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_oBSOLETEConferenceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_callerNameFromNetwork) {
    PBDataWriterWriteStringField();
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v6 = self->_protoCalls;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v98 objects:v111 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v99;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v99 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v98 objects:v111 count:16];
    }
    while (v8);
  }

  if (self->_hardPauseDigits) {
    PBDataWriterWriteStringField();
  }
  $D957FAF0D32A69CAB50B82F534D16002 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    $D957FAF0D32A69CAB50B82F534D16002 v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x400) == 0)
    {
LABEL_36:
      if ((*(unsigned char *)&v11 & 0x40) == 0) {
        goto LABEL_37;
      }
      goto LABEL_172;
    }
  }
  else if ((*(_WORD *)&v11 & 0x400) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt32Field();
  $D957FAF0D32A69CAB50B82F534D16002 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x40) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v11 & 0x400000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_172:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x400000) != 0) {
LABEL_38:
  }
    PBDataWriterWriteBOOLField();
LABEL_39:
  if (self->_dummyPayload) {
    PBDataWriterWriteDataField();
  }
  $D957FAF0D32A69CAB50B82F534D16002 v12 = self->_has;
  if (*(unsigned char *)&v12)
  {
    PBDataWriterWriteDoubleField();
    $D957FAF0D32A69CAB50B82F534D16002 v12 = self->_has;
    if ((*(unsigned char *)&v12 & 2) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v12 & 0x80000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_176;
    }
  }
  else if ((*(unsigned char *)&v12 & 2) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteDoubleField();
  $D957FAF0D32A69CAB50B82F534D16002 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v12 & 0x8000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_177;
  }
LABEL_176:
  PBDataWriterWriteBOOLField();
  $D957FAF0D32A69CAB50B82F534D16002 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x8000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v12 & 0x20000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_177:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x20000) != 0) {
LABEL_46:
  }
    PBDataWriterWriteBOOLField();
LABEL_47:
  if (self->_contactIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_protoCallCapabilitiesState) {
    PBDataWriterWriteSubmessage();
  }
  $D957FAF0D32A69CAB50B82F534D16002 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    $D957FAF0D32A69CAB50B82F534D16002 v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x10000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v14 = self->_otherUniqueProxyIdentifiers;
  long long v15 = (char *)[(NSMutableArray *)v14 countByEnumeratingWithState:&v94 objects:v110 count:16];
  if (v15)
  {
    long long v16 = v15;
    uint64_t v17 = *(void *)v95;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v95 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteStringField();
        ++v18;
      }
      while (v16 != v18);
      long long v16 = (char *)[(NSMutableArray *)v14 countByEnumeratingWithState:&v94 objects:v110 count:16];
    }
    while (v16);
  }

  if (self->_protoCallModel) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_handle) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v19 = self->_providers;
  id v20 = (char *)[(NSMutableArray *)v19 countByEnumeratingWithState:&v90 objects:v109 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v91;
    do
    {
      id v23 = 0;
      do
      {
        if (*(void *)v91 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      id v21 = (char *)[(NSMutableArray *)v19 countByEnumeratingWithState:&v90 objects:v109 count:16];
    }
    while (v21);
  }

  if (self->_protoDisplayContext) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_inviteData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_protoProvider) {
    PBDataWriterWriteSubmessage();
  }
  $D957FAF0D32A69CAB50B82F534D16002 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $D957FAF0D32A69CAB50B82F534D16002 v24 = self->_has;
    if ((*(_DWORD *)&v24 & 0x4000000) == 0)
    {
LABEL_83:
      if ((*(_DWORD *)&v24 & 0x100000) == 0) {
        goto LABEL_84;
      }
      goto LABEL_181;
    }
  }
  else if ((*(_DWORD *)&v24 & 0x4000000) == 0)
  {
    goto LABEL_83;
  }
  PBDataWriterWriteBOOLField();
  $D957FAF0D32A69CAB50B82F534D16002 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x100000) == 0)
  {
LABEL_84:
    if ((*(_WORD *)&v24 & 0x1000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
LABEL_181:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_85:
  }
    PBDataWriterWriteFloatField();
LABEL_86:
  if (self->_localSenderIdentityUUIDString) {
    PBDataWriterWriteStringField();
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v25 = self->_remoteParticipantHandles;
  $D957FAF0D32A69CAB50B82F534D16002 v26 = (char *)[(NSMutableArray *)v25 countByEnumeratingWithState:&v86 objects:v108 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v87;
    do
    {
      $D957FAF0D32A69CAB50B82F534D16002 v29 = 0;
      do
      {
        if (*(void *)v87 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = (char *)[(NSMutableArray *)v25 countByEnumeratingWithState:&v86 objects:v108 count:16];
    }
    while (v27);
  }

  if (self->_localSenderIdentityAccountUUIDString) {
    PBDataWriterWriteStringField();
  }
  $D957FAF0D32A69CAB50B82F534D16002 v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    $D957FAF0D32A69CAB50B82F534D16002 v30 = self->_has;
    if ((*(_DWORD *)&v30 & 0x2000000) == 0)
    {
LABEL_99:
      if ((*(_WORD *)&v30 & 0x800) == 0) {
        goto LABEL_101;
      }
      goto LABEL_100;
    }
  }
  else if ((*(_DWORD *)&v30 & 0x2000000) == 0)
  {
    goto LABEL_99;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_100:
  }
    PBDataWriterWriteInt32Field();
LABEL_101:
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v31 = self->_routes;
  id v32 = (char *)[(NSMutableArray *)v31 countByEnumeratingWithState:&v82 objects:v107 count:16];
  if (v32)
  {
    long long v33 = v32;
    uint64_t v34 = *(void *)v83;
    do
    {
      id v35 = 0;
      do
      {
        if (*(void *)v83 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      long long v33 = (char *)[(NSMutableArray *)v31 countByEnumeratingWithState:&v82 objects:v107 count:16];
    }
    while (v33);
  }

  if (self->_route) {
    PBDataWriterWriteSubmessage();
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v36 = self->_endpointIDSDestinationURIs;
  long long v37 = (char *)[(NSMutableArray *)v36 countByEnumeratingWithState:&v78 objects:v106 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v79;
    do
    {
      id v40 = 0;
      do
      {
        if (*(void *)v79 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteStringField();
        ++v40;
      }
      while (v38 != v40);
      id v38 = (char *)[(NSMutableArray *)v36 countByEnumeratingWithState:&v78 objects:v106 count:16];
    }
    while (v38);
  }

  if (self->_isoCountryCode) {
    PBDataWriterWriteStringField();
  }
  $D957FAF0D32A69CAB50B82F534D16002 v41 = self->_has;
  if ((*(unsigned char *)&v41 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    $D957FAF0D32A69CAB50B82F534D16002 v41 = self->_has;
    if ((*(unsigned char *)&v41 & 0x10) == 0)
    {
LABEL_121:
      if ((*(_DWORD *)&v41 & 0x40000) == 0) {
        goto LABEL_122;
      }
      goto LABEL_188;
    }
  }
  else if ((*(unsigned char *)&v41 & 0x10) == 0)
  {
    goto LABEL_121;
  }
  PBDataWriterWriteUint32Field();
  $D957FAF0D32A69CAB50B82F534D16002 v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x40000) == 0)
  {
LABEL_122:
    if ((*(_DWORD *)&v41 & 0x1000000) == 0) {
      goto LABEL_124;
    }
    goto LABEL_123;
  }
LABEL_188:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x1000000) != 0) {
LABEL_123:
  }
    PBDataWriterWriteBOOLField();
LABEL_124:
  if (self->_groupUUIDString) {
    PBDataWriterWriteStringField();
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v42 = self->_conversations;
  double v43 = (char *)[(NSMutableArray *)v42 countByEnumeratingWithState:&v74 objects:v105 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v75;
    do
    {
      id v46 = 0;
      do
      {
        if (*(void *)v75 != v45) {
          objc_enumerationMutation(v42);
        }
        PBDataWriterWriteSubmessage();
        ++v46;
      }
      while (v44 != v46);
      id v44 = (char *)[(NSMutableArray *)v42 countByEnumeratingWithState:&v74 objects:v105 count:16];
    }
    while (v44);
  }

  if (self->_joinConversationRequestURLString) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationUUIDString) {
    PBDataWriterWriteStringField();
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v47 = self->_conversationMembers;
  uint64_t v48 = (char *)[(NSMutableArray *)v47 countByEnumeratingWithState:&v70 objects:v104 count:16];
  if (v48)
  {
    v49 = v48;
    uint64_t v50 = *(void *)v71;
    do
    {
      v51 = 0;
      do
      {
        if (*(void *)v71 != v50) {
          objc_enumerationMutation(v47);
        }
        PBDataWriterWriteSubmessage();
        ++v51;
      }
      while (v49 != v51);
      v49 = (char *)[(NSMutableArray *)v47 countByEnumeratingWithState:&v70 objects:v104 count:16];
    }
    while (v49);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v52 = self->_handlesToInvites;
  v53 = (char *)[(NSMutableArray *)v52 countByEnumeratingWithState:&v66 objects:v103 count:16];
  if (v53)
  {
    v54 = v53;
    uint64_t v55 = *(void *)v67;
    do
    {
      v56 = 0;
      do
      {
        if (*(void *)v67 != v55) {
          objc_enumerationMutation(v52);
        }
        PBDataWriterWriteSubmessage();
        ++v56;
      }
      while (v54 != v56);
      v54 = (char *)[(NSMutableArray *)v52 countByEnumeratingWithState:&v66 objects:v103 count:16];
    }
    while (v54);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  $D957FAF0D32A69CAB50B82F534D16002 v57 = self->_prominenceEntrys;
  v58 = (char *)[(NSMutableArray *)v57 countByEnumeratingWithState:&v62 objects:v102 count:16];
  if (v58)
  {
    v59 = v58;
    uint64_t v60 = *(void *)v63;
    do
    {
      v61 = 0;
      do
      {
        if (*(void *)v63 != v60) {
          objc_enumerationMutation(v57);
        }
        PBDataWriterWriteSubmessage();
        ++v61;
      }
      while (v59 != v61);
      v59 = (char *)[(NSMutableArray *)v57 countByEnumeratingWithState:&v62 objects:v102 count:16];
    }
    while (v59);
  }

  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_dtmfUpdateDigits) {
    PBDataWriterWriteStringField();
  }
  if (self->_image) {
    PBDataWriterWriteDataField();
  }
  if (self->_senderIDSIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    v4[93] = self->_type;
    v4[100] |= 0x2000u;
  }
  uint64_t v55 = v4;
  if (self->_uniqueProxyIdentifier)
  {
    objc_msgSend(v4, "setUniqueProxyIdentifier:");
    id v4 = v55;
  }
  if (self->_destinationID)
  {
    objc_msgSend(v55, "setDestinationID:");
    id v4 = v55;
  }
  if (self->_sourceIdentifier)
  {
    objc_msgSend(v55, "setSourceIdentifier:");
    id v4 = v55;
  }
  if (self->_protoCallModelState)
  {
    objc_msgSend(v55, "setProtoCallModelState:");
    id v4 = v55;
  }
  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    v4[72] = self->_protoService;
    v4[100] |= 0x80u;
    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_13;
  }
  *((unsigned char *)v4 + 399) = self->_protoWantsHoldMusic;
  v4[100] |= 0x20000000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_14:
    *((unsigned char *)v4 + 384) = self->_protoCannotBeAnswered;
    v4[100] |= 0x4000u;
  }
LABEL_15:
  if (self->_protoDTMFKey)
  {
    objc_msgSend(v55, "setProtoDTMFKey:");
    id v4 = v55;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[62] = self->_protoDisconnectedReason;
    v4[100] |= 8u;
  }
  if (self->_oBSOLETEConferenceIdentifier)
  {
    objc_msgSend(v55, "setOBSOLETEConferenceIdentifier:");
    id v4 = v55;
  }
  if ((*((unsigned char *)&self->_has + 3) & 0x10) != 0)
  {
    *((unsigned char *)v4 + 398) = self->_protoVoicemail;
    v4[100] |= 0x10000000u;
  }
  if (self->_callerNameFromNetwork) {
    objc_msgSend(v55, "setCallerNameFromNetwork:");
  }
  if ([(CSDMessagingRelayMessage *)self protoCallsCount])
  {
    [v55 clearProtoCalls];
    unint64_t v6 = [(CSDMessagingRelayMessage *)self protoCallsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CSDMessagingRelayMessage *)self protoCallAtIndex:i];
        [v55 addProtoCall:v9];
      }
    }
  }
  if (self->_hardPauseDigits) {
    objc_msgSend(v55, "setHardPauseDigits:");
  }
  $D957FAF0D32A69CAB50B82F534D16002 v10 = self->_has;
  $D957FAF0D32A69CAB50B82F534D16002 v11 = v55;
  if ((*(unsigned char *)&v10 & 4) != 0)
  {
    v55[32] = self->_hardPauseState;
    v55[100] |= 4u;
    $D957FAF0D32A69CAB50B82F534D16002 v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x400) == 0)
    {
LABEL_33:
      if ((*(unsigned char *)&v10 & 0x40) == 0) {
        goto LABEL_34;
      }
      goto LABEL_144;
    }
  }
  else if ((*(_WORD *)&v10 & 0x400) == 0)
  {
    goto LABEL_33;
  }
  v55[78] = self->_receivedMessageType;
  v55[100] |= 0x400u;
  $D957FAF0D32A69CAB50B82F534D16002 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v10 & 0x400000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_144:
  v55[68] = self->_protoProtocolVersion;
  v55[100] |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_35:
    *((unsigned char *)v55 + 392) = self->_protoShouldSuppressRingtone;
    v55[100] |= 0x400000u;
  }
LABEL_36:
  if (self->_dummyPayload)
  {
    objc_msgSend(v55, "setDummyPayload:");
    $D957FAF0D32A69CAB50B82F534D16002 v11 = v55;
  }
  $D957FAF0D32A69CAB50B82F534D16002 v12 = self->_has;
  if (*(unsigned char *)&v12)
  {
    v11[1] = *(void *)&self->_hostCallCreationTime;
    *((_DWORD *)v11 + 100) |= 1u;
    $D957FAF0D32A69CAB50B82F534D16002 v12 = self->_has;
    if ((*(unsigned char *)&v12 & 2) == 0)
    {
LABEL_40:
      if ((*(_DWORD *)&v12 & 0x80000) == 0) {
        goto LABEL_41;
      }
      goto LABEL_148;
    }
  }
  else if ((*(unsigned char *)&v12 & 2) == 0)
  {
    goto LABEL_40;
  }
  v11[2] = *(void *)&self->_messageSendTime;
  *((_DWORD *)v11 + 100) |= 2u;
  $D957FAF0D32A69CAB50B82F534D16002 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v12 & 0x8000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((unsigned char *)v11 + 389) = self->_protoNeedsManualInCallSounds;
  *((_DWORD *)v11 + 100) |= 0x80000u;
  $D957FAF0D32A69CAB50B82F534D16002 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x8000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v12 & 0x20000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_149:
  *((unsigned char *)v11 + 385) = self->_protoCannotRelayAudioOrVideoOnPairedDevice;
  *((_DWORD *)v11 + 100) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_43:
    *((unsigned char *)v11 + 387) = self->_protoExpectedEndpointOnMessagingDevice;
    *((_DWORD *)v11 + 100) |= 0x20000u;
  }
LABEL_44:
  if (self->_contactIdentifier)
  {
    objc_msgSend(v55, "setContactIdentifier:");
    $D957FAF0D32A69CAB50B82F534D16002 v11 = v55;
  }
  if (self->_protoCallCapabilitiesState)
  {
    objc_msgSend(v55, "setProtoCallCapabilitiesState:");
    $D957FAF0D32A69CAB50B82F534D16002 v11 = v55;
  }
  $D957FAF0D32A69CAB50B82F534D16002 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
    *((_DWORD *)v11 + 73) = self->_protoSoundRegion;
    *((_DWORD *)v11 + 100) |= 0x100u;
    $D957FAF0D32A69CAB50B82F534D16002 v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x10000) != 0)
  {
    *((unsigned char *)v11 + 386) = self->_protoEmergency;
    *((_DWORD *)v11 + 100) |= 0x10000u;
  }
  if ([(CSDMessagingRelayMessage *)self otherUniqueProxyIdentifiersCount])
  {
    [v55 clearOtherUniqueProxyIdentifiers];
    unint64_t v14 = [(CSDMessagingRelayMessage *)self otherUniqueProxyIdentifiersCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t j = 0; j != v15; ++j)
      {
        uint64_t v17 = [(CSDMessagingRelayMessage *)self otherUniqueProxyIdentifiersAtIndex:j];
        [v55 addOtherUniqueProxyIdentifiers:v17];
      }
    }
  }
  if (self->_protoCallModel) {
    objc_msgSend(v55, "setProtoCallModel:");
  }
  if (self->_handle) {
    objc_msgSend(v55, "setHandle:");
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    *((unsigned char *)v55 + 391) = self->_protoSOS;
    v55[100] |= 0x200000u;
  }
  if ([(CSDMessagingRelayMessage *)self providersCount])
  {
    [v55 clearProviders];
    unint64_t v18 = [(CSDMessagingRelayMessage *)self providersCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t k = 0; k != v19; ++k)
      {
        id v21 = [(CSDMessagingRelayMessage *)self providersAtIndex:k];
        [v55 addProviders:v21];
      }
    }
  }
  if (self->_protoDisplayContext) {
    objc_msgSend(v55, "setProtoDisplayContext:");
  }
  uint64_t v22 = v55;
  if (self->_inviteData)
  {
    objc_msgSend(v55, "setInviteData:");
    uint64_t v22 = v55;
  }
  if (self->_protoProvider)
  {
    objc_msgSend(v55, "setProtoProvider:");
    uint64_t v22 = v55;
  }
  $D957FAF0D32A69CAB50B82F534D16002 v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x8000000) != 0)
  {
    v22[397] = self->_protoVideo;
    *((_DWORD *)v22 + 100) |= 0x8000000u;
    $D957FAF0D32A69CAB50B82F534D16002 v23 = self->_has;
    if ((*(_DWORD *)&v23 & 0x4000000) == 0)
    {
LABEL_74:
      if ((*(_DWORD *)&v23 & 0x100000) == 0) {
        goto LABEL_75;
      }
      goto LABEL_153;
    }
  }
  else if ((*(_DWORD *)&v23 & 0x4000000) == 0)
  {
    goto LABEL_74;
  }
  v22[396] = self->_protoUplinkMuted;
  *((_DWORD *)v22 + 100) |= 0x4000000u;
  $D957FAF0D32A69CAB50B82F534D16002 v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x100000) == 0)
  {
LABEL_75:
    if ((*(_WORD *)&v23 & 0x1000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }
LABEL_153:
  v22[390] = self->_protoRemoteUplinkMuted;
  *((_DWORD *)v22 + 100) |= 0x100000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_76:
    *((_DWORD *)v22 + 92) = LODWORD(self->_systemVolume);
    *((_DWORD *)v22 + 100) |= 0x1000u;
  }
LABEL_77:
  if (self->_localSenderIdentityUUIDString) {
    objc_msgSend(v55, "setLocalSenderIdentityUUIDString:");
  }
  if ([(CSDMessagingRelayMessage *)self remoteParticipantHandlesCount])
  {
    [v55 clearRemoteParticipantHandles];
    unint64_t v24 = [(CSDMessagingRelayMessage *)self remoteParticipantHandlesCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (uint64_t m = 0; m != v25; ++m)
      {
        uint64_t v27 = [(CSDMessagingRelayMessage *)self remoteParticipantHandlesAtIndex:m];
        [v55 addRemoteParticipantHandles:v27];
      }
    }
  }
  if (self->_localSenderIdentityAccountUUIDString) {
    objc_msgSend(v55, "setLocalSenderIdentityAccountUUIDString:");
  }
  $D957FAF0D32A69CAB50B82F534D16002 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x200) == 0)
  {
    if ((*(_DWORD *)&v28 & 0x2000000) == 0) {
      goto LABEL_87;
    }
LABEL_156:
    *((unsigned char *)v55 + 395) = self->_protoSupportsTTYWithVoice;
    v55[100] |= 0x2000000u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0) {
      goto LABEL_89;
    }
    goto LABEL_88;
  }
  v55[74] = self->_protoTTYType;
  v55[100] |= 0x200u;
  $D957FAF0D32A69CAB50B82F534D16002 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x2000000) != 0) {
    goto LABEL_156;
  }
LABEL_87:
  if ((*(_WORD *)&v28 & 0x800) != 0)
  {
LABEL_88:
    v55[82] = self->_requestActionType;
    v55[100] |= 0x800u;
  }
LABEL_89:
  if ([(CSDMessagingRelayMessage *)self routesCount])
  {
    [v55 clearRoutes];
    unint64_t v29 = [(CSDMessagingRelayMessage *)self routesCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (uint64_t n = 0; n != v30; ++n)
      {
        id v32 = [(CSDMessagingRelayMessage *)self routesAtIndex:n];
        [v55 addRoutes:v32];
      }
    }
  }
  if (self->_route) {
    objc_msgSend(v55, "setRoute:");
  }
  if ([(CSDMessagingRelayMessage *)self endpointIDSDestinationURIsCount])
  {
    [v55 clearEndpointIDSDestinationURIs];
    unint64_t v33 = [(CSDMessagingRelayMessage *)self endpointIDSDestinationURIsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (iuint64_t i = 0; ii != v34; ++ii)
      {
        long long v36 = [(CSDMessagingRelayMessage *)self endpointIDSDestinationURIsAtIndex:ii];
        [v55 addEndpointIDSDestinationURIs:v36];
      }
    }
  }
  if (self->_isoCountryCode) {
    objc_msgSend(v55, "setIsoCountryCode:");
  }
  $D957FAF0D32A69CAB50B82F534D16002 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 0x20) != 0)
  {
    v55[67] = self->_protoPriority;
    v55[100] |= 0x20u;
    $D957FAF0D32A69CAB50B82F534D16002 v37 = self->_has;
    if ((*(unsigned char *)&v37 & 0x10) == 0)
    {
LABEL_103:
      if ((*(_DWORD *)&v37 & 0x40000) == 0) {
        goto LABEL_104;
      }
      goto LABEL_160;
    }
  }
  else if ((*(unsigned char *)&v37 & 0x10) == 0)
  {
    goto LABEL_103;
  }
  v55[66] = self->_protoOriginatingUIType;
  v55[100] |= 0x10u;
  $D957FAF0D32A69CAB50B82F534D16002 v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x40000) == 0)
  {
LABEL_104:
    if ((*(_DWORD *)&v37 & 0x1000000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_105;
  }
LABEL_160:
  *((unsigned char *)v55 + 388) = self->_protoFailureExpected;
  v55[100] |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x1000000) != 0)
  {
LABEL_105:
    *((unsigned char *)v55 + 394) = self->_protoSupportsEmergencyFallback;
    v55[100] |= 0x1000000u;
  }
LABEL_106:
  if (self->_groupUUIDString) {
    objc_msgSend(v55, "setGroupUUIDString:");
  }
  if ([(CSDMessagingRelayMessage *)self conversationsCount])
  {
    [v55 clearConversations];
    unint64_t v38 = [(CSDMessagingRelayMessage *)self conversationsCount];
    if (v38)
    {
      unint64_t v39 = v38;
      for (juint64_t j = 0; jj != v39; ++jj)
      {
        $D957FAF0D32A69CAB50B82F534D16002 v41 = [(CSDMessagingRelayMessage *)self conversationsAtIndex:jj];
        [v55 addConversations:v41];
      }
    }
  }
  if (self->_joinConversationRequestURLString) {
    objc_msgSend(v55, "setJoinConversationRequestURLString:");
  }
  if (self->_conversationUUIDString) {
    objc_msgSend(v55, "setConversationUUIDString:");
  }
  if ([(CSDMessagingRelayMessage *)self conversationMembersCount])
  {
    [v55 clearConversationMembers];
    unint64_t v42 = [(CSDMessagingRelayMessage *)self conversationMembersCount];
    if (v42)
    {
      unint64_t v43 = v42;
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        uint64_t v45 = [(CSDMessagingRelayMessage *)self conversationMembersAtIndex:kk];
        [v55 addConversationMembers:v45];
      }
    }
  }
  if ([(CSDMessagingRelayMessage *)self handlesToInvitesCount])
  {
    [v55 clearHandlesToInvites];
    unint64_t v46 = [(CSDMessagingRelayMessage *)self handlesToInvitesCount];
    if (v46)
    {
      unint64_t v47 = v46;
      for (muint64_t m = 0; mm != v47; ++mm)
      {
        v49 = [(CSDMessagingRelayMessage *)self handlesToInviteAtIndex:mm];
        [v55 addHandlesToInvite:v49];
      }
    }
  }
  if ([(CSDMessagingRelayMessage *)self prominenceEntrysCount])
  {
    [v55 clearProminenceEntrys];
    unint64_t v50 = [(CSDMessagingRelayMessage *)self prominenceEntrysCount];
    if (v50)
    {
      unint64_t v51 = v50;
      for (nuint64_t n = 0; nn != v51; ++nn)
      {
        v53 = [(CSDMessagingRelayMessage *)self prominenceEntryAtIndex:nn];
        [v55 addProminenceEntry:v53];
      }
    }
  }
  v54 = v55;
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *((unsigned char *)v55 + 393) = self->_protoSupportsDTMFUpdates;
    v55[100] |= 0x800000u;
  }
  if (self->_dtmfUpdateDigits)
  {
    objc_msgSend(v55, "setDtmfUpdateDigits:");
    v54 = v55;
  }
  if (self->_image)
  {
    objc_msgSend(v55, "setImage:");
    v54 = v55;
  }
  if (self->_senderIDSIdentifier)
  {
    objc_msgSend(v55, "setSenderIDSIdentifier:");
    v54 = v55;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    v5[93] = self->_type;
    v5[100] |= 0x2000u;
  }
  id v7 = [(NSString *)self->_uniqueProxyIdentifier copyWithZone:a3];
  id v8 = (void *)v6[47];
  v6[47] = v7;

  id v9 = [(NSString *)self->_destinationID copyWithZone:a3];
  $D957FAF0D32A69CAB50B82F534D16002 v10 = (void *)v6[8];
  v6[8] = v9;

  id v11 = [(NSString *)self->_sourceIdentifier copyWithZone:a3];
  $D957FAF0D32A69CAB50B82F534D16002 v12 = (void *)v6[45];
  v6[45] = v11;

  id v13 = [(CSDMessagingCallModelState *)self->_protoCallModelState copyWithZone:a3];
  unint64_t v14 = (void *)v6[28];
  v6[28] = v13;

  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *((_DWORD *)v6 + 72) = self->_protoService;
    *((_DWORD *)v6 + 100) |= 0x80u;
    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000000) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v6 + 399) = self->_protoWantsHoldMusic;
  *((_DWORD *)v6 + 100) |= 0x20000000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_6:
    *((unsigned char *)v6 + 384) = self->_protoCannotBeAnswered;
    *((_DWORD *)v6 + 100) |= 0x4000u;
  }
LABEL_7:
  id v16 = [(NSData *)self->_protoDTMFKey copyWithZone:a3];
  uint64_t v17 = (void *)v6[30];
  v6[30] = v16;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v6 + 62) = self->_protoDisconnectedReason;
    *((_DWORD *)v6 + 100) |= 8u;
  }
  id v18 = [(NSString *)self->_oBSOLETEConferenceIdentifier copyWithZone:a3];
  unint64_t v19 = (void *)v6[23];
  v6[23] = v18;

  if ((*((unsigned char *)&self->_has + 3) & 0x10) != 0)
  {
    *((unsigned char *)v6 + 398) = self->_protoVoicemail;
    *((_DWORD *)v6 + 100) |= 0x10000000u;
  }
  id v20 = [(NSString *)self->_callerNameFromNetwork copyWithZone:a3];
  id v21 = (void *)v6[3];
  v6[3] = v20;

  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  uint64_t v22 = self->_protoCalls;
  id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v164 objects:v177 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v165;
    do
    {
      $D957FAF0D32A69CAB50B82F534D16002 v26 = 0;
      do
      {
        if (*(void *)v165 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = [*(id *)(*((void *)&v164 + 1) + 8 * (void)v26) copyWithZone:a3];
        [v6 addProtoCall:v27];

        $D957FAF0D32A69CAB50B82F534D16002 v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v164 objects:v177 count:16];
    }
    while (v24);
  }

  id v28 = [(NSString *)self->_hardPauseDigits copyWithZone:a3];
  unint64_t v29 = (void *)v6[15];
  v6[15] = v28;

  $D957FAF0D32A69CAB50B82F534D16002 v30 = self->_has;
  if ((*(unsigned char *)&v30 & 4) != 0)
  {
    *((_DWORD *)v6 + 32) = self->_hardPauseState;
    *((_DWORD *)v6 + 100) |= 4u;
    $D957FAF0D32A69CAB50B82F534D16002 v30 = self->_has;
    if ((*(_WORD *)&v30 & 0x400) == 0)
    {
LABEL_20:
      if ((*(unsigned char *)&v30 & 0x40) == 0) {
        goto LABEL_21;
      }
      goto LABEL_120;
    }
  }
  else if ((*(_WORD *)&v30 & 0x400) == 0)
  {
    goto LABEL_20;
  }
  *((_DWORD *)v6 + 78) = self->_receivedMessageType;
  *((_DWORD *)v6 + 100) |= 0x400u;
  $D957FAF0D32A69CAB50B82F534D16002 v30 = self->_has;
  if ((*(unsigned char *)&v30 & 0x40) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v30 & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_120:
  *((_DWORD *)v6 + 68) = self->_protoProtocolVersion;
  *((_DWORD *)v6 + 100) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_22:
    *((unsigned char *)v6 + 392) = self->_protoShouldSuppressRingtone;
    *((_DWORD *)v6 + 100) |= 0x400000u;
  }
LABEL_23:
  id v31 = [(NSData *)self->_dummyPayload copyWithZone:a3];
  id v32 = (void *)v6[10];
  v6[10] = v31;

  $D957FAF0D32A69CAB50B82F534D16002 v33 = self->_has;
  if (*(unsigned char *)&v33)
  {
    v6[1] = *(void *)&self->_hostCallCreationTime;
    *((_DWORD *)v6 + 100) |= 1u;
    $D957FAF0D32A69CAB50B82F534D16002 v33 = self->_has;
    if ((*(unsigned char *)&v33 & 2) == 0)
    {
LABEL_25:
      if ((*(_DWORD *)&v33 & 0x80000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_124;
    }
  }
  else if ((*(unsigned char *)&v33 & 2) == 0)
  {
    goto LABEL_25;
  }
  v6[2] = *(void *)&self->_messageSendTime;
  *((_DWORD *)v6 + 100) |= 2u;
  $D957FAF0D32A69CAB50B82F534D16002 v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x80000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v33 & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((unsigned char *)v6 + 389) = self->_protoNeedsManualInCallSounds;
  *((_DWORD *)v6 + 100) |= 0x80000u;
  $D957FAF0D32A69CAB50B82F534D16002 v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v33 & 0x20000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_125:
  *((unsigned char *)v6 + 385) = self->_protoCannotRelayAudioOrVideoOnPairedDevice;
  *((_DWORD *)v6 + 100) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_28:
    *((unsigned char *)v6 + 387) = self->_protoExpectedEndpointOnMessagingDevice;
    *((_DWORD *)v6 + 100) |= 0x20000u;
  }
LABEL_29:
  id v34 = [(NSString *)self->_contactIdentifier copyWithZone:a3];
  id v35 = (void *)v6[4];
  v6[4] = v34;

  id v36 = [(CSDMessagingCallCapabilitiesState *)self->_protoCallCapabilitiesState copyWithZone:a3];
  $D957FAF0D32A69CAB50B82F534D16002 v37 = (void *)v6[26];
  v6[26] = v36;

  $D957FAF0D32A69CAB50B82F534D16002 v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x100) != 0)
  {
    *((_DWORD *)v6 + 73) = self->_protoSoundRegion;
    *((_DWORD *)v6 + 100) |= 0x100u;
    $D957FAF0D32A69CAB50B82F534D16002 v38 = self->_has;
  }
  if ((*(_DWORD *)&v38 & 0x10000) != 0)
  {
    *((unsigned char *)v6 + 386) = self->_protoEmergency;
    *((_DWORD *)v6 + 100) |= 0x10000u;
  }
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  unint64_t v39 = self->_otherUniqueProxyIdentifiers;
  id v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v160 objects:v176 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v161;
    do
    {
      unint64_t v43 = 0;
      do
      {
        if (*(void *)v161 != v42) {
          objc_enumerationMutation(v39);
        }
        id v44 = [*(id *)(*((void *)&v160 + 1) + 8 * (void)v43) copyWithZone:a3];
        [v6 addOtherUniqueProxyIdentifiers:v44];

        unint64_t v43 = (char *)v43 + 1;
      }
      while (v41 != v43);
      id v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v160 objects:v176 count:16];
    }
    while (v41);
  }

  id v45 = [(CSDMessagingCallModel *)self->_protoCallModel copyWithZone:a3];
  unint64_t v46 = (void *)v6[27];
  v6[27] = v45;

  id v47 = [(CSDMessagingHandle *)self->_handle copyWithZone:a3];
  uint64_t v48 = (void *)v6[13];
  v6[13] = v47;

  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    *((unsigned char *)v6 + 391) = self->_protoSOS;
    *((_DWORD *)v6 + 100) |= 0x200000u;
  }
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  v49 = self->_providers;
  id v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v156 objects:v175 count:16];
  if (v50)
  {
    id v51 = v50;
    uint64_t v52 = *(void *)v157;
    do
    {
      v53 = 0;
      do
      {
        if (*(void *)v157 != v52) {
          objc_enumerationMutation(v49);
        }
        id v54 = [*(id *)(*((void *)&v156 + 1) + 8 * (void)v53) copyWithZone:a3];
        [v6 addProviders:v54];

        v53 = (char *)v53 + 1;
      }
      while (v51 != v53);
      id v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v156 objects:v175 count:16];
    }
    while (v51);
  }

  id v55 = [(CSDMessagingCallDisplayContext *)self->_protoDisplayContext copyWithZone:a3];
  v56 = (void *)v6[32];
  v6[32] = v55;

  id v57 = [(CSDMessagingAVConferenceInviteData *)self->_inviteData copyWithZone:a3];
  v58 = (void *)v6[18];
  v6[18] = v57;

  id v59 = [(CSDMessagingCallProvider *)self->_protoProvider copyWithZone:a3];
  uint64_t v60 = (void *)v6[35];
  v6[35] = v59;

  $D957FAF0D32A69CAB50B82F534D16002 v61 = self->_has;
  if ((*(_DWORD *)&v61 & 0x8000000) != 0)
  {
    *((unsigned char *)v6 + 397) = self->_protoVideo;
    *((_DWORD *)v6 + 100) |= 0x8000000u;
    $D957FAF0D32A69CAB50B82F534D16002 v61 = self->_has;
    if ((*(_DWORD *)&v61 & 0x4000000) == 0)
    {
LABEL_51:
      if ((*(_DWORD *)&v61 & 0x100000) == 0) {
        goto LABEL_52;
      }
      goto LABEL_129;
    }
  }
  else if ((*(_DWORD *)&v61 & 0x4000000) == 0)
  {
    goto LABEL_51;
  }
  *((unsigned char *)v6 + 396) = self->_protoUplinkMuted;
  *((_DWORD *)v6 + 100) |= 0x4000000u;
  $D957FAF0D32A69CAB50B82F534D16002 v61 = self->_has;
  if ((*(_DWORD *)&v61 & 0x100000) == 0)
  {
LABEL_52:
    if ((*(_WORD *)&v61 & 0x1000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_129:
  *((unsigned char *)v6 + 390) = self->_protoRemoteUplinkMuted;
  *((_DWORD *)v6 + 100) |= 0x100000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_53:
    *((_DWORD *)v6 + 92) = LODWORD(self->_systemVolume);
    *((_DWORD *)v6 + 100) |= 0x1000u;
  }
LABEL_54:
  id v62 = [(NSString *)self->_localSenderIdentityUUIDString copyWithZone:a3];
  long long v63 = (void *)v6[22];
  v6[22] = v62;

  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v64 = self->_remoteParticipantHandles;
  id v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v152 objects:v174 count:16];
  if (v65)
  {
    id v66 = v65;
    uint64_t v67 = *(void *)v153;
    do
    {
      long long v68 = 0;
      do
      {
        if (*(void *)v153 != v67) {
          objc_enumerationMutation(v64);
        }
        id v69 = [*(id *)(*((void *)&v152 + 1) + 8 * (void)v68) copyWithZone:a3];
        [v6 addRemoteParticipantHandles:v69];

        long long v68 = (char *)v68 + 1;
      }
      while (v66 != v68);
      id v66 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v152 objects:v174 count:16];
    }
    while (v66);
  }

  id v70 = [(NSString *)self->_localSenderIdentityAccountUUIDString copyWithZone:a3];
  long long v71 = (void *)v6[21];
  v6[21] = v70;

  $D957FAF0D32A69CAB50B82F534D16002 v72 = self->_has;
  if ((*(_WORD *)&v72 & 0x200) != 0)
  {
    *((_DWORD *)v6 + 74) = self->_protoTTYType;
    *((_DWORD *)v6 + 100) |= 0x200u;
    $D957FAF0D32A69CAB50B82F534D16002 v72 = self->_has;
    if ((*(_DWORD *)&v72 & 0x2000000) == 0)
    {
LABEL_63:
      if ((*(_WORD *)&v72 & 0x800) == 0) {
        goto LABEL_65;
      }
      goto LABEL_64;
    }
  }
  else if ((*(_DWORD *)&v72 & 0x2000000) == 0)
  {
    goto LABEL_63;
  }
  *((unsigned char *)v6 + 395) = self->_protoSupportsTTYWithVoice;
  *((_DWORD *)v6 + 100) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_64:
    *((_DWORD *)v6 + 82) = self->_requestActionType;
    *((_DWORD *)v6 + 100) |= 0x800u;
  }
LABEL_65:
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v73 = self->_routes;
  id v74 = [(NSMutableArray *)v73 countByEnumeratingWithState:&v148 objects:v173 count:16];
  if (v74)
  {
    id v75 = v74;
    uint64_t v76 = *(void *)v149;
    do
    {
      long long v77 = 0;
      do
      {
        if (*(void *)v149 != v76) {
          objc_enumerationMutation(v73);
        }
        id v78 = [*(id *)(*((void *)&v148 + 1) + 8 * (void)v77) copyWithZone:a3];
        [v6 addRoutes:v78];

        long long v77 = (char *)v77 + 1;
      }
      while (v75 != v77);
      id v75 = [(NSMutableArray *)v73 countByEnumeratingWithState:&v148 objects:v173 count:16];
    }
    while (v75);
  }

  id v79 = [(CSDMessagingRoute *)self->_route copyWithZone:a3];
  long long v80 = (void *)v6[42];
  v6[42] = v79;

  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v81 = self->_endpointIDSDestinationURIs;
  id v82 = [(NSMutableArray *)v81 countByEnumeratingWithState:&v144 objects:v172 count:16];
  if (v82)
  {
    id v83 = v82;
    uint64_t v84 = *(void *)v145;
    do
    {
      long long v85 = 0;
      do
      {
        if (*(void *)v145 != v84) {
          objc_enumerationMutation(v81);
        }
        id v86 = [*(id *)(*((void *)&v144 + 1) + 8 * (void)v85) copyWithZone:a3];
        [v6 addEndpointIDSDestinationURIs:v86];

        long long v85 = (char *)v85 + 1;
      }
      while (v83 != v85);
      id v83 = [(NSMutableArray *)v81 countByEnumeratingWithState:&v144 objects:v172 count:16];
    }
    while (v83);
  }

  id v87 = [(NSString *)self->_isoCountryCode copyWithZone:a3];
  long long v88 = (void *)v6[19];
  v6[19] = v87;

  $D957FAF0D32A69CAB50B82F534D16002 v89 = self->_has;
  if ((*(unsigned char *)&v89 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 67) = self->_protoPriority;
    *((_DWORD *)v6 + 100) |= 0x20u;
    $D957FAF0D32A69CAB50B82F534D16002 v89 = self->_has;
    if ((*(unsigned char *)&v89 & 0x10) == 0)
    {
LABEL_81:
      if ((*(_DWORD *)&v89 & 0x40000) == 0) {
        goto LABEL_82;
      }
      goto LABEL_136;
    }
  }
  else if ((*(unsigned char *)&v89 & 0x10) == 0)
  {
    goto LABEL_81;
  }
  *((_DWORD *)v6 + 66) = self->_protoOriginatingUIType;
  *((_DWORD *)v6 + 100) |= 0x10u;
  $D957FAF0D32A69CAB50B82F534D16002 v89 = self->_has;
  if ((*(_DWORD *)&v89 & 0x40000) == 0)
  {
LABEL_82:
    if ((*(_DWORD *)&v89 & 0x1000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_136:
  *((unsigned char *)v6 + 388) = self->_protoFailureExpected;
  *((_DWORD *)v6 + 100) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x1000000) != 0)
  {
LABEL_83:
    *((unsigned char *)v6 + 394) = self->_protoSupportsEmergencyFallback;
    *((_DWORD *)v6 + 100) |= 0x1000000u;
  }
LABEL_84:
  id v90 = [(NSString *)self->_groupUUIDString copyWithZone:a3];
  long long v91 = (void *)v6[12];
  v6[12] = v90;

  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v92 = self->_conversations;
  id v93 = [(NSMutableArray *)v92 countByEnumeratingWithState:&v140 objects:v171 count:16];
  if (v93)
  {
    id v94 = v93;
    uint64_t v95 = *(void *)v141;
    do
    {
      long long v96 = 0;
      do
      {
        if (*(void *)v141 != v95) {
          objc_enumerationMutation(v92);
        }
        id v97 = [*(id *)(*((void *)&v140 + 1) + 8 * (void)v96) copyWithZone:a3];
        [v6 addConversations:v97];

        long long v96 = (char *)v96 + 1;
      }
      while (v94 != v96);
      id v94 = [(NSMutableArray *)v92 countByEnumeratingWithState:&v140 objects:v171 count:16];
    }
    while (v94);
  }

  id v98 = [(NSString *)self->_joinConversationRequestURLString copyWithZone:a3];
  long long v99 = (void *)v6[20];
  v6[20] = v98;

  id v100 = [(NSString *)self->_conversationUUIDString copyWithZone:a3];
  long long v101 = (void *)v6[6];
  v6[6] = v100;

  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v102 = self->_conversationMembers;
  id v103 = [(NSMutableArray *)v102 countByEnumeratingWithState:&v136 objects:v170 count:16];
  if (v103)
  {
    id v104 = v103;
    uint64_t v105 = *(void *)v137;
    do
    {
      v106 = 0;
      do
      {
        if (*(void *)v137 != v105) {
          objc_enumerationMutation(v102);
        }
        id v107 = [*(id *)(*((void *)&v136 + 1) + 8 * (void)v106) copyWithZone:a3];
        [v6 addConversationMembers:v107];

        v106 = (char *)v106 + 1;
      }
      while (v104 != v106);
      id v104 = [(NSMutableArray *)v102 countByEnumeratingWithState:&v136 objects:v170 count:16];
    }
    while (v104);
  }

  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  v108 = self->_handlesToInvites;
  id v109 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v132 objects:v169 count:16];
  if (v109)
  {
    id v110 = v109;
    uint64_t v111 = *(void *)v133;
    do
    {
      id v112 = 0;
      do
      {
        if (*(void *)v133 != v111) {
          objc_enumerationMutation(v108);
        }
        id v113 = [*(id *)(*((void *)&v132 + 1) + 8 * (void)v112) copyWithZone:a3];
        [v6 addHandlesToInvite:v113];

        id v112 = (char *)v112 + 1;
      }
      while (v110 != v112);
      id v110 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v132 objects:v169 count:16];
    }
    while (v110);
  }

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  v114 = self->_prominenceEntrys;
  id v115 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v128 objects:v168 count:16];
  if (v115)
  {
    id v116 = v115;
    uint64_t v117 = *(void *)v129;
    do
    {
      id v118 = 0;
      do
      {
        if (*(void *)v129 != v117) {
          objc_enumerationMutation(v114);
        }
        id v119 = objc_msgSend(*(id *)(*((void *)&v128 + 1) + 8 * (void)v118), "copyWithZone:", a3, (void)v128);
        [v6 addProminenceEntry:v119];

        id v118 = (char *)v118 + 1;
      }
      while (v116 != v118);
      id v116 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v128 objects:v168 count:16];
    }
    while (v116);
  }

  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *((unsigned char *)v6 + 393) = self->_protoSupportsDTMFUpdates;
    *((_DWORD *)v6 + 100) |= 0x800000u;
  }
  id v120 = -[NSString copyWithZone:](self->_dtmfUpdateDigits, "copyWithZone:", a3, (void)v128);
  v121 = (void *)v6[9];
  v6[9] = v120;

  id v122 = [(NSData *)self->_image copyWithZone:a3];
  id v123 = (void *)v6[17];
  v6[17] = v122;

  id v124 = [(NSString *)self->_senderIDSIdentifier copyWithZone:a3];
  id v125 = (void *)v6[44];
  v6[44] = v124;

  id v126 = v6;
  return v126;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_275;
  }
  int v5 = *((_DWORD *)v4 + 100);
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    if ((v5 & 0x2000) == 0 || self->_type != *((_DWORD *)v4 + 93)) {
      goto LABEL_275;
    }
  }
  else if ((v5 & 0x2000) != 0)
  {
    goto LABEL_275;
  }
  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  if ((unint64_t)uniqueProxyIdentifier | *((void *)v4 + 47)
    && !-[NSString isEqual:](uniqueProxyIdentifier, "isEqual:"))
  {
    goto LABEL_275;
  }
  destinationID = self->_destinationID;
  if ((unint64_t)destinationID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](destinationID, "isEqual:")) {
      goto LABEL_275;
    }
  }
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((void *)v4 + 45))
  {
    if (!-[NSString isEqual:](sourceIdentifier, "isEqual:")) {
      goto LABEL_275;
    }
  }
  protoCallModelState = self->_protoCallModelState;
  if ((unint64_t)protoCallModelState | *((void *)v4 + 28))
  {
    if (!-[CSDMessagingCallModelState isEqual:](protoCallModelState, "isEqual:")) {
      goto LABEL_275;
    }
  }
  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  int v11 = *((_DWORD *)v4 + 100);
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_protoService != *((_DWORD *)v4 + 72)) {
      goto LABEL_275;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v11 & 0x20000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoWantsHoldMusic)
    {
      if (!*((unsigned char *)v4 + 399)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 399))
    {
      goto LABEL_275;
    }
  }
  else if ((v11 & 0x20000000) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoCannotBeAnswered)
    {
      if (!*((unsigned char *)v4 + 384)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 384))
    {
      goto LABEL_275;
    }
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_275;
  }
  protoDTMFKey = self->_protoDTMFKey;
  if ((unint64_t)protoDTMFKey | *((void *)v4 + 30))
  {
    if (!-[NSData isEqual:](protoDTMFKey, "isEqual:")) {
      goto LABEL_275;
    }
    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  }
  int v13 = *((_DWORD *)v4 + 100);
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_protoDisconnectedReason != *((_DWORD *)v4 + 62)) {
      goto LABEL_275;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_275;
  }
  oBSOLETEConferenceIdentifier = self->_oBSOLETEConferenceIdentifier;
  if ((unint64_t)oBSOLETEConferenceIdentifier | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](oBSOLETEConferenceIdentifier, "isEqual:")) {
      goto LABEL_275;
    }
    $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  }
  int v15 = *((_DWORD *)v4 + 100);
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v15 & 0x10000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoVoicemail)
    {
      if (!*((unsigned char *)v4 + 398)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 398))
    {
      goto LABEL_275;
    }
  }
  else if ((v15 & 0x10000000) != 0)
  {
    goto LABEL_275;
  }
  callerNameFromNetworuint64_t k = self->_callerNameFromNetwork;
  if ((unint64_t)callerNameFromNetwork | *((void *)v4 + 3)
    && !-[NSString isEqual:](callerNameFromNetwork, "isEqual:"))
  {
    goto LABEL_275;
  }
  protoCalls = self->_protoCalls;
  if ((unint64_t)protoCalls | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](protoCalls, "isEqual:")) {
      goto LABEL_275;
    }
  }
  hardPauseDigits = self->_hardPauseDigits;
  if ((unint64_t)hardPauseDigits | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](hardPauseDigits, "isEqual:")) {
      goto LABEL_275;
    }
  }
  $D957FAF0D32A69CAB50B82F534D16002 v19 = self->_has;
  int v20 = *((_DWORD *)v4 + 100);
  if ((*(unsigned char *)&v19 & 4) != 0)
  {
    if ((v20 & 4) == 0 || self->_hardPauseState != *((_DWORD *)v4 + 32)) {
      goto LABEL_275;
    }
  }
  else if ((v20 & 4) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_WORD *)&v19 & 0x400) != 0)
  {
    if ((v20 & 0x400) == 0 || self->_receivedMessageType != *((_DWORD *)v4 + 78)) {
      goto LABEL_275;
    }
  }
  else if ((v20 & 0x400) != 0)
  {
    goto LABEL_275;
  }
  if ((*(unsigned char *)&v19 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_protoProtocolVersion != *((_DWORD *)v4 + 68)) {
      goto LABEL_275;
    }
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_DWORD *)&v19 & 0x400000) != 0)
  {
    if ((v20 & 0x400000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoShouldSuppressRingtone)
    {
      if (!*((unsigned char *)v4 + 392)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 392))
    {
      goto LABEL_275;
    }
  }
  else if ((v20 & 0x400000) != 0)
  {
    goto LABEL_275;
  }
  dummyPayload = self->_dummyPayload;
  if ((unint64_t)dummyPayload | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](dummyPayload, "isEqual:")) {
      goto LABEL_275;
    }
    $D957FAF0D32A69CAB50B82F534D16002 v19 = self->_has;
  }
  int v22 = *((_DWORD *)v4 + 100);
  if (*(unsigned char *)&v19)
  {
    if ((v22 & 1) == 0 || self->_hostCallCreationTime != *((double *)v4 + 1)) {
      goto LABEL_275;
    }
  }
  else if (v22)
  {
    goto LABEL_275;
  }
  if ((*(unsigned char *)&v19 & 2) != 0)
  {
    if ((v22 & 2) == 0 || self->_messageSendTime != *((double *)v4 + 2)) {
      goto LABEL_275;
    }
  }
  else if ((v22 & 2) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_DWORD *)&v19 & 0x80000) != 0)
  {
    if ((v22 & 0x80000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoNeedsManualInCallSounds)
    {
      if (!*((unsigned char *)v4 + 389)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 389))
    {
      goto LABEL_275;
    }
  }
  else if ((v22 & 0x80000) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_WORD *)&v19 & 0x8000) != 0)
  {
    if ((v22 & 0x8000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoCannotRelayAudioOrVideoOnPairedDevice)
    {
      if (!*((unsigned char *)v4 + 385)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 385))
    {
      goto LABEL_275;
    }
  }
  else if ((v22 & 0x8000) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_DWORD *)&v19 & 0x20000) != 0)
  {
    if ((v22 & 0x20000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoExpectedEndpointOnMessagingDevice)
    {
      if (!*((unsigned char *)v4 + 387)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 387))
    {
      goto LABEL_275;
    }
  }
  else if ((v22 & 0x20000) != 0)
  {
    goto LABEL_275;
  }
  contactIdentifier = self->_contactIdentifier;
  if ((unint64_t)contactIdentifier | *((void *)v4 + 4)
    && !-[NSString isEqual:](contactIdentifier, "isEqual:"))
  {
    goto LABEL_275;
  }
  protoCallCapabilitiesState = self->_protoCallCapabilitiesState;
  if ((unint64_t)protoCallCapabilitiesState | *((void *)v4 + 26))
  {
    if (!-[CSDMessagingCallCapabilitiesState isEqual:](protoCallCapabilitiesState, "isEqual:")) {
      goto LABEL_275;
    }
  }
  $D957FAF0D32A69CAB50B82F534D16002 v25 = self->_has;
  int v26 = *((_DWORD *)v4 + 100);
  if ((*(_WORD *)&v25 & 0x100) != 0)
  {
    if ((v26 & 0x100) == 0 || self->_protoSoundRegion != *((_DWORD *)v4 + 73)) {
      goto LABEL_275;
    }
  }
  else if ((v26 & 0x100) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_DWORD *)&v25 & 0x10000) != 0)
  {
    if ((v26 & 0x10000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoEmergency)
    {
      if (!*((unsigned char *)v4 + 386)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 386))
    {
      goto LABEL_275;
    }
  }
  else if ((v26 & 0x10000) != 0)
  {
    goto LABEL_275;
  }
  otherUniqueProxyIdentifiers = self->_otherUniqueProxyIdentifiers;
  if ((unint64_t)otherUniqueProxyIdentifiers | *((void *)v4 + 24)
    && !-[NSMutableArray isEqual:](otherUniqueProxyIdentifiers, "isEqual:"))
  {
    goto LABEL_275;
  }
  protoCallModel = self->_protoCallModel;
  if ((unint64_t)protoCallModel | *((void *)v4 + 27))
  {
    if (!-[CSDMessagingCallModel isEqual:](protoCallModel, "isEqual:")) {
      goto LABEL_275;
    }
  }
  handle = self->_handle;
  if ((unint64_t)handle | *((void *)v4 + 13))
  {
    if (!-[CSDMessagingHandle isEqual:](handle, "isEqual:")) {
      goto LABEL_275;
    }
  }
  int v30 = *((_DWORD *)v4 + 100);
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    if ((v30 & 0x200000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoSOS)
    {
      if (!*((unsigned char *)v4 + 391)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 391))
    {
      goto LABEL_275;
    }
  }
  else if ((v30 & 0x200000) != 0)
  {
    goto LABEL_275;
  }
  providers = self->_providers;
  if ((unint64_t)providers | *((void *)v4 + 38)
    && !-[NSMutableArray isEqual:](providers, "isEqual:"))
  {
    goto LABEL_275;
  }
  protoDisplayContext = self->_protoDisplayContext;
  if ((unint64_t)protoDisplayContext | *((void *)v4 + 32))
  {
    if (!-[CSDMessagingCallDisplayContext isEqual:](protoDisplayContext, "isEqual:")) {
      goto LABEL_275;
    }
  }
  inviteData = self->_inviteData;
  if ((unint64_t)inviteData | *((void *)v4 + 18))
  {
    if (!-[CSDMessagingAVConferenceInviteData isEqual:](inviteData, "isEqual:")) {
      goto LABEL_275;
    }
  }
  protoProvider = self->_protoProvider;
  if ((unint64_t)protoProvider | *((void *)v4 + 35))
  {
    if (!-[CSDMessagingCallProvider isEqual:](protoProvider, "isEqual:")) {
      goto LABEL_275;
    }
  }
  $D957FAF0D32A69CAB50B82F534D16002 v35 = self->_has;
  int v36 = *((_DWORD *)v4 + 100);
  if ((*(_DWORD *)&v35 & 0x8000000) != 0)
  {
    if ((v36 & 0x8000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoVideo)
    {
      if (!*((unsigned char *)v4 + 397)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 397))
    {
      goto LABEL_275;
    }
  }
  else if ((v36 & 0x8000000) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_DWORD *)&v35 & 0x4000000) != 0)
  {
    if ((v36 & 0x4000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoUplinkMuted)
    {
      if (!*((unsigned char *)v4 + 396)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 396))
    {
      goto LABEL_275;
    }
  }
  else if ((v36 & 0x4000000) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_DWORD *)&v35 & 0x100000) != 0)
  {
    if ((v36 & 0x100000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoRemoteUplinkMuted)
    {
      if (!*((unsigned char *)v4 + 390)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 390))
    {
      goto LABEL_275;
    }
  }
  else if ((v36 & 0x100000) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_WORD *)&v35 & 0x1000) != 0)
  {
    if ((v36 & 0x1000) == 0 || self->_systemVolume != *((float *)v4 + 92)) {
      goto LABEL_275;
    }
  }
  else if ((v36 & 0x1000) != 0)
  {
    goto LABEL_275;
  }
  localSenderIdentityUUIDString = self->_localSenderIdentityUUIDString;
  if ((unint64_t)localSenderIdentityUUIDString | *((void *)v4 + 22)
    && !-[NSString isEqual:](localSenderIdentityUUIDString, "isEqual:"))
  {
    goto LABEL_275;
  }
  remoteParticipantHandles = self->_remoteParticipantHandles;
  if ((unint64_t)remoteParticipantHandles | *((void *)v4 + 40))
  {
    if (!-[NSMutableArray isEqual:](remoteParticipantHandles, "isEqual:")) {
      goto LABEL_275;
    }
  }
  localSenderIdentityAccountUUIDString = self->_localSenderIdentityAccountUUIDString;
  if ((unint64_t)localSenderIdentityAccountUUIDString | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](localSenderIdentityAccountUUIDString, "isEqual:")) {
      goto LABEL_275;
    }
  }
  $D957FAF0D32A69CAB50B82F534D16002 v40 = self->_has;
  int v41 = *((_DWORD *)v4 + 100);
  if ((*(_WORD *)&v40 & 0x200) != 0)
  {
    if ((v41 & 0x200) == 0 || self->_protoTTYType != *((_DWORD *)v4 + 74)) {
      goto LABEL_275;
    }
  }
  else if ((v41 & 0x200) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_DWORD *)&v40 & 0x2000000) != 0)
  {
    if ((v41 & 0x2000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoSupportsTTYWithVoice)
    {
      if (!*((unsigned char *)v4 + 395)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 395))
    {
      goto LABEL_275;
    }
  }
  else if ((v41 & 0x2000000) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_WORD *)&v40 & 0x800) != 0)
  {
    if ((v41 & 0x800) == 0 || self->_requestActionType != *((_DWORD *)v4 + 82)) {
      goto LABEL_275;
    }
  }
  else if ((v41 & 0x800) != 0)
  {
    goto LABEL_275;
  }
  routes = self->_routes;
  if ((unint64_t)routes | *((void *)v4 + 43) && !-[NSMutableArray isEqual:](routes, "isEqual:")) {
    goto LABEL_275;
  }
  route = self->_route;
  if ((unint64_t)route | *((void *)v4 + 42))
  {
    if (!-[CSDMessagingRoute isEqual:](route, "isEqual:")) {
      goto LABEL_275;
    }
  }
  endpointIDSDestinationURIs = self->_endpointIDSDestinationURIs;
  if ((unint64_t)endpointIDSDestinationURIs | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](endpointIDSDestinationURIs, "isEqual:")) {
      goto LABEL_275;
    }
  }
  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](isoCountryCode, "isEqual:")) {
      goto LABEL_275;
    }
  }
  $D957FAF0D32A69CAB50B82F534D16002 v46 = self->_has;
  int v47 = *((_DWORD *)v4 + 100);
  if ((*(unsigned char *)&v46 & 0x20) != 0)
  {
    if ((v47 & 0x20) == 0 || self->_protoPriority != *((_DWORD *)v4 + 67)) {
      goto LABEL_275;
    }
  }
  else if ((v47 & 0x20) != 0)
  {
    goto LABEL_275;
  }
  if ((*(unsigned char *)&v46 & 0x10) != 0)
  {
    if ((v47 & 0x10) == 0 || self->_protoOriginatingUIType != *((_DWORD *)v4 + 66)) {
      goto LABEL_275;
    }
  }
  else if ((v47 & 0x10) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_DWORD *)&v46 & 0x40000) != 0)
  {
    if ((v47 & 0x40000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoFailureExpected)
    {
      if (!*((unsigned char *)v4 + 388)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 388))
    {
      goto LABEL_275;
    }
  }
  else if ((v47 & 0x40000) != 0)
  {
    goto LABEL_275;
  }
  if ((*(_DWORD *)&v46 & 0x1000000) != 0)
  {
    if ((v47 & 0x1000000) == 0) {
      goto LABEL_275;
    }
    if (self->_protoSupportsEmergencyFallback)
    {
      if (!*((unsigned char *)v4 + 394)) {
        goto LABEL_275;
      }
    }
    else if (*((unsigned char *)v4 + 394))
    {
      goto LABEL_275;
    }
  }
  else if ((v47 & 0x1000000) != 0)
  {
    goto LABEL_275;
  }
  groupUUIDString = self->_groupUUIDString;
  if ((unint64_t)groupUUIDString | *((void *)v4 + 12)
    && !-[NSString isEqual:](groupUUIDString, "isEqual:"))
  {
    goto LABEL_275;
  }
  conversations = self->_conversations;
  if ((unint64_t)conversations | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](conversations, "isEqual:")) {
      goto LABEL_275;
    }
  }
  joinConversationRequestURLString = self->_joinConversationRequestURLString;
  if ((unint64_t)joinConversationRequestURLString | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](joinConversationRequestURLString, "isEqual:")) {
      goto LABEL_275;
    }
  }
  conversationUUIDString = self->_conversationUUIDString;
  if ((unint64_t)conversationUUIDString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](conversationUUIDString, "isEqual:")) {
      goto LABEL_275;
    }
  }
  conversationMembers = self->_conversationMembers;
  if ((unint64_t)conversationMembers | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](conversationMembers, "isEqual:")) {
      goto LABEL_275;
    }
  }
  handlesToInvites = self->_handlesToInvites;
  if ((unint64_t)handlesToInvites | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](handlesToInvites, "isEqual:")) {
      goto LABEL_275;
    }
  }
  prominenceEntrys = self->_prominenceEntrys;
  if ((unint64_t)prominenceEntrys | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](prominenceEntrys, "isEqual:")) {
      goto LABEL_275;
    }
  }
  int v55 = *((_DWORD *)v4 + 100);
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    if ((v55 & 0x800000) != 0)
    {
      if (self->_protoSupportsDTMFUpdates)
      {
        if (!*((unsigned char *)v4 + 393)) {
          goto LABEL_275;
        }
        goto LABEL_269;
      }
      if (!*((unsigned char *)v4 + 393)) {
        goto LABEL_269;
      }
    }
LABEL_275:
    unsigned __int8 v59 = 0;
    goto LABEL_276;
  }
  if ((v55 & 0x800000) != 0) {
    goto LABEL_275;
  }
LABEL_269:
  dtmfUpdateDigits = self->_dtmfUpdateDigits;
  if ((unint64_t)dtmfUpdateDigits | *((void *)v4 + 9)
    && !-[NSString isEqual:](dtmfUpdateDigits, "isEqual:"))
  {
    goto LABEL_275;
  }
  image = self->_image;
  if ((unint64_t)image | *((void *)v4 + 17))
  {
    if (!-[NSData isEqual:](image, "isEqual:")) {
      goto LABEL_275;
    }
  }
  senderIDSIdentifier = self->_senderIDSIdentifier;
  if ((unint64_t)senderIDSIdentifier | *((void *)v4 + 44)) {
    unsigned __int8 v59 = -[NSString isEqual:](senderIDSIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v59 = 1;
  }
LABEL_276:

  return v59;
}

- (unint64_t)hash
{
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    uint64_t v90 = 2654435761 * self->_type;
  }
  else {
    uint64_t v90 = 0;
  }
  NSUInteger v89 = [(NSString *)self->_uniqueProxyIdentifier hash];
  NSUInteger v88 = [(NSString *)self->_destinationID hash];
  NSUInteger v87 = [(NSString *)self->_sourceIdentifier hash];
  unint64_t v86 = [(CSDMessagingCallModelState *)self->_protoCallModelState hash];
  $D957FAF0D32A69CAB50B82F534D16002 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
    uint64_t v85 = 0;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v84 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v85 = 2654435761 * self->_protoService;
  if ((*(_DWORD *)&has & 0x20000000) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v84 = 2654435761 * self->_protoWantsHoldMusic;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_7:
    uint64_t v83 = 2654435761 * self->_protoCannotBeAnswered;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v83 = 0;
LABEL_11:
  unint64_t v82 = (unint64_t)[(NSData *)self->_protoDTMFKey hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v81 = 2654435761 * self->_protoDisconnectedReason;
  }
  else {
    uint64_t v81 = 0;
  }
  NSUInteger v80 = [(NSString *)self->_oBSOLETEConferenceIdentifier hash];
  if ((*((unsigned char *)&self->_has + 3) & 0x10) != 0) {
    uint64_t v79 = 2654435761 * self->_protoVoicemail;
  }
  else {
    uint64_t v79 = 0;
  }
  NSUInteger v78 = [(NSString *)self->_callerNameFromNetwork hash];
  unint64_t v77 = (unint64_t)[(NSMutableArray *)self->_protoCalls hash];
  NSUInteger v76 = [(NSString *)self->_hardPauseDigits hash];
  $D957FAF0D32A69CAB50B82F534D16002 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
    uint64_t v75 = 2654435761 * self->_hardPauseState;
    if ((*(_WORD *)&v4 & 0x400) != 0)
    {
LABEL_19:
      uint64_t v74 = 2654435761 * self->_receivedMessageType;
      if ((*(unsigned char *)&v4 & 0x40) != 0) {
        goto LABEL_20;
      }
LABEL_24:
      uint64_t v73 = 0;
      if ((*(_DWORD *)&v4 & 0x400000) != 0) {
        goto LABEL_21;
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v75 = 0;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_19;
    }
  }
  uint64_t v74 = 0;
  if ((*(unsigned char *)&v4 & 0x40) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v73 = 2654435761 * self->_protoProtocolVersion;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_21:
    uint64_t v72 = 2654435761 * self->_protoShouldSuppressRingtone;
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v72 = 0;
LABEL_26:
  unint64_t v71 = (unint64_t)[(NSData *)self->_dummyPayload hash];
  $D957FAF0D32A69CAB50B82F534D16002 v5 = self->_has;
  if (*(unsigned char *)&v5)
  {
    double hostCallCreationTime = self->_hostCallCreationTime;
    double v8 = -hostCallCreationTime;
    if (hostCallCreationTime >= 0.0) {
      double v8 = self->_hostCallCreationTime;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((*(unsigned char *)&v5 & 2) != 0)
  {
    double messageSendTime = self->_messageSendTime;
    double v13 = -messageSendTime;
    if (messageSendTime >= 0.0) {
      double v13 = self->_messageSendTime;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((*(_DWORD *)&v5 & 0x80000) != 0)
  {
    uint64_t v69 = 2654435761 * self->_protoNeedsManualInCallSounds;
    if ((*(_WORD *)&v5 & 0x8000) != 0) {
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v69 = 0;
    if ((*(_WORD *)&v5 & 0x8000) != 0)
    {
LABEL_44:
      uint64_t v68 = 2654435761 * self->_protoCannotRelayAudioOrVideoOnPairedDevice;
      goto LABEL_47;
    }
  }
  uint64_t v68 = 0;
LABEL_47:
  unint64_t v70 = v11;
  if ((*(_DWORD *)&v5 & 0x20000) != 0) {
    uint64_t v67 = 2654435761 * self->_protoExpectedEndpointOnMessagingDevice;
  }
  else {
    uint64_t v67 = 0;
  }
  NSUInteger v66 = [(NSString *)self->_contactIdentifier hash];
  unint64_t v65 = [(CSDMessagingCallCapabilitiesState *)self->_protoCallCapabilitiesState hash];
  $D957FAF0D32A69CAB50B82F534D16002 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x100) != 0)
  {
    uint64_t v64 = 2654435761 * self->_protoSoundRegion;
    if ((*(_DWORD *)&v16 & 0x10000) != 0) {
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v64 = 0;
    if ((*(_DWORD *)&v16 & 0x10000) != 0)
    {
LABEL_52:
      uint64_t v63 = 2654435761 * self->_protoEmergency;
      goto LABEL_55;
    }
  }
  uint64_t v63 = 0;
LABEL_55:
  unint64_t v62 = (unint64_t)[(NSMutableArray *)self->_otherUniqueProxyIdentifiers hash];
  unint64_t v61 = [(CSDMessagingCallModel *)self->_protoCallModel hash];
  unint64_t v60 = [(CSDMessagingHandle *)self->_handle hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    uint64_t v59 = 2654435761 * self->_protoSOS;
  }
  else {
    uint64_t v59 = 0;
  }
  unint64_t v58 = (unint64_t)[(NSMutableArray *)self->_providers hash];
  unint64_t v57 = [(CSDMessagingCallDisplayContext *)self->_protoDisplayContext hash];
  unint64_t v56 = [(CSDMessagingAVConferenceInviteData *)self->_inviteData hash];
  unint64_t v55 = [(CSDMessagingCallProvider *)self->_protoProvider hash];
  $D957FAF0D32A69CAB50B82F534D16002 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x8000000) != 0)
  {
    uint64_t v54 = 2654435761 * self->_protoVideo;
    if ((*(_DWORD *)&v17 & 0x4000000) != 0)
    {
LABEL_60:
      uint64_t v53 = 2654435761 * self->_protoUplinkMuted;
      if ((*(_DWORD *)&v17 & 0x100000) != 0) {
        goto LABEL_61;
      }
LABEL_68:
      uint64_t v52 = 0;
      if ((*(_WORD *)&v17 & 0x1000) != 0) {
        goto LABEL_62;
      }
LABEL_69:
      unint64_t v22 = 0;
      goto LABEL_72;
    }
  }
  else
  {
    uint64_t v54 = 0;
    if ((*(_DWORD *)&v17 & 0x4000000) != 0) {
      goto LABEL_60;
    }
  }
  uint64_t v53 = 0;
  if ((*(_DWORD *)&v17 & 0x100000) == 0) {
    goto LABEL_68;
  }
LABEL_61:
  uint64_t v52 = 2654435761 * self->_protoRemoteUplinkMuted;
  if ((*(_WORD *)&v17 & 0x1000) == 0) {
    goto LABEL_69;
  }
LABEL_62:
  float systemVolume = self->_systemVolume;
  float v19 = -systemVolume;
  if (systemVolume >= 0.0) {
    float v19 = self->_systemVolume;
  }
  float v20 = floorf(v19 + 0.5);
  float v21 = (float)(v19 - v20) * 1.8447e19;
  unint64_t v22 = 2654435761u * (unint64_t)fmodf(v20, 1.8447e19);
  if (v21 >= 0.0)
  {
    if (v21 > 0.0) {
      v22 += (unint64_t)v21;
    }
  }
  else
  {
    v22 -= (unint64_t)fabsf(v21);
  }
LABEL_72:
  unint64_t v51 = v22;
  NSUInteger v50 = [(NSString *)self->_localSenderIdentityUUIDString hash];
  unint64_t v49 = (unint64_t)[(NSMutableArray *)self->_remoteParticipantHandles hash];
  NSUInteger v48 = [(NSString *)self->_localSenderIdentityAccountUUIDString hash];
  $D957FAF0D32A69CAB50B82F534D16002 v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x200) == 0)
  {
    uint64_t v47 = 0;
    if ((*(_DWORD *)&v23 & 0x2000000) != 0) {
      goto LABEL_74;
    }
LABEL_77:
    uint64_t v46 = 0;
    if ((*(_WORD *)&v23 & 0x800) != 0) {
      goto LABEL_75;
    }
    goto LABEL_78;
  }
  uint64_t v47 = 2654435761 * self->_protoTTYType;
  if ((*(_DWORD *)&v23 & 0x2000000) == 0) {
    goto LABEL_77;
  }
LABEL_74:
  uint64_t v46 = 2654435761 * self->_protoSupportsTTYWithVoice;
  if ((*(_WORD *)&v23 & 0x800) != 0)
  {
LABEL_75:
    uint64_t v45 = 2654435761 * self->_requestActionType;
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v45 = 0;
LABEL_79:
  unint64_t v44 = (unint64_t)[(NSMutableArray *)self->_routes hash];
  unint64_t v43 = [(CSDMessagingRoute *)self->_route hash];
  unint64_t v42 = (unint64_t)[(NSMutableArray *)self->_endpointIDSDestinationURIs hash];
  NSUInteger v41 = [(NSString *)self->_isoCountryCode hash];
  $D957FAF0D32A69CAB50B82F534D16002 v24 = self->_has;
  if ((*(unsigned char *)&v24 & 0x20) != 0)
  {
    uint64_t v40 = 2654435761 * self->_protoPriority;
    if ((*(unsigned char *)&v24 & 0x10) != 0)
    {
LABEL_81:
      uint64_t v39 = 2654435761 * self->_protoOriginatingUIType;
      if ((*(_DWORD *)&v24 & 0x40000) != 0) {
        goto LABEL_82;
      }
LABEL_86:
      uint64_t v38 = 0;
      if ((*(_DWORD *)&v24 & 0x1000000) != 0) {
        goto LABEL_83;
      }
      goto LABEL_87;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if ((*(unsigned char *)&v24 & 0x10) != 0) {
      goto LABEL_81;
    }
  }
  uint64_t v39 = 0;
  if ((*(_DWORD *)&v24 & 0x40000) == 0) {
    goto LABEL_86;
  }
LABEL_82:
  uint64_t v38 = 2654435761 * self->_protoFailureExpected;
  if ((*(_DWORD *)&v24 & 0x1000000) != 0)
  {
LABEL_83:
    uint64_t v37 = 2654435761 * self->_protoSupportsEmergencyFallback;
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v37 = 0;
LABEL_88:
  NSUInteger v25 = [(NSString *)self->_groupUUIDString hash];
  unint64_t v26 = (unint64_t)[(NSMutableArray *)self->_conversations hash];
  NSUInteger v27 = [(NSString *)self->_joinConversationRequestURLString hash];
  NSUInteger v28 = [(NSString *)self->_conversationUUIDString hash];
  unint64_t v29 = (unint64_t)[(NSMutableArray *)self->_conversationMembers hash];
  unint64_t v30 = (unint64_t)[(NSMutableArray *)self->_handlesToInvites hash];
  unint64_t v31 = (unint64_t)[(NSMutableArray *)self->_prominenceEntrys hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    uint64_t v32 = 2654435761 * self->_protoSupportsDTMFUpdates;
  }
  else {
    uint64_t v32 = 0;
  }
  NSUInteger v33 = v89 ^ v90 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v6 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v25 ^ v26 ^ v27 ^ v28;
  unint64_t v34 = v29 ^ v30 ^ v31 ^ v32 ^ [(NSString *)self->_dtmfUpdateDigits hash];
  unint64_t v35 = v34 ^ (unint64_t)[(NSData *)self->_image hash];
  return v33 ^ v35 ^ [(NSString *)self->_senderIDSIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  $D957FAF0D32A69CAB50B82F534D16002 v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 401) & 0x20) != 0)
  {
    self->_uint64_t type = v4[93];
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v4 + 47)) {
    -[CSDMessagingRelayMessage setUniqueProxyIdentifier:](self, "setUniqueProxyIdentifier:");
  }
  if (*((void *)v5 + 8)) {
    -[CSDMessagingRelayMessage setDestinationID:](self, "setDestinationID:");
  }
  if (*((void *)v5 + 45)) {
    -[CSDMessagingRelayMessage setSourceIdentifier:](self, "setSourceIdentifier:");
  }
  protoCallModelState = self->_protoCallModelState;
  uint64_t v7 = *((void *)v5 + 28);
  if (protoCallModelState)
  {
    if (v7) {
      -[CSDMessagingCallModelState mergeFrom:](protoCallModelState, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[CSDMessagingRelayMessage setProtoCallModelState:](self, "setProtoCallModelState:");
  }
  int v8 = *((_DWORD *)v5 + 100);
  if ((v8 & 0x80) != 0)
  {
    self->_protoService = *((_DWORD *)v5 + 72);
    *(_DWORD *)&self->_has |= 0x80u;
    int v8 = *((_DWORD *)v5 + 100);
    if ((v8 & 0x20000000) == 0)
    {
LABEL_16:
      if ((v8 & 0x4000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v8 & 0x20000000) == 0)
  {
    goto LABEL_16;
  }
  self->_protoWantsHoldMusic = *((unsigned char *)v5 + 399);
  *(_DWORD *)&self->_has |= 0x20000000u;
  if ((*((_DWORD *)v5 + 100) & 0x4000) != 0)
  {
LABEL_17:
    self->_protoCannotBeAnswered = *((unsigned char *)v5 + 384);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_18:
  if (*((void *)v5 + 30)) {
    -[CSDMessagingRelayMessage setProtoDTMFKey:](self, "setProtoDTMFKey:");
  }
  if ((*((unsigned char *)v5 + 400) & 8) != 0)
  {
    self->_protoDisconnectedReasouint64_t n = *((_DWORD *)v5 + 62);
    *(_DWORD *)&self->_has |= 8u;
  }
  if (*((void *)v5 + 23)) {
    -[CSDMessagingRelayMessage setOBSOLETEConferenceIdentifier:](self, "setOBSOLETEConferenceIdentifier:");
  }
  if ((*((unsigned char *)v5 + 403) & 0x10) != 0)
  {
    self->_protoVoicemail = *((unsigned char *)v5 + 398);
    *(_DWORD *)&self->_has |= 0x10000000u;
  }
  if (*((void *)v5 + 3)) {
    -[CSDMessagingRelayMessage setCallerNameFromNetwork:](self, "setCallerNameFromNetwork:");
  }
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v9 = *((id *)v5 + 29);
  id v10 = [v9 countByEnumeratingWithState:&v115 objects:v128 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v116;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v116 != v12) {
          objc_enumerationMutation(v9);
        }
        [(CSDMessagingRelayMessage *)self addProtoCall:*(void *)(*((void *)&v115 + 1) + 8 * i)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v115 objects:v128 count:16];
    }
    while (v11);
  }

  if (*((void *)v5 + 15)) {
    -[CSDMessagingRelayMessage setHardPauseDigits:](self, "setHardPauseDigits:");
  }
  int v14 = *((_DWORD *)v5 + 100);
  if ((v14 & 4) != 0)
  {
    self->_hardPauseState = *((_DWORD *)v5 + 32);
    *(_DWORD *)&self->_has |= 4u;
    int v14 = *((_DWORD *)v5 + 100);
    if ((v14 & 0x400) == 0)
    {
LABEL_39:
      if ((v14 & 0x40) == 0) {
        goto LABEL_40;
      }
      goto LABEL_60;
    }
  }
  else if ((v14 & 0x400) == 0)
  {
    goto LABEL_39;
  }
  self->_uint64_t receivedMessageType = *((_DWORD *)v5 + 78);
  *(_DWORD *)&self->_has |= 0x400u;
  int v14 = *((_DWORD *)v5 + 100);
  if ((v14 & 0x40) == 0)
  {
LABEL_40:
    if ((v14 & 0x400000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_60:
  self->_protoProtocolVersiouint64_t n = *((_DWORD *)v5 + 68);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v5 + 100) & 0x400000) != 0)
  {
LABEL_41:
    self->_protoShouldSuppressRingtone = *((unsigned char *)v5 + 392);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
LABEL_42:
  if (*((void *)v5 + 10)) {
    -[CSDMessagingRelayMessage setDummyPayload:](self, "setDummyPayload:");
  }
  int v15 = *((_DWORD *)v5 + 100);
  if (v15)
  {
    self->_double hostCallCreationTime = *((double *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v15 = *((_DWORD *)v5 + 100);
    if ((v15 & 2) == 0)
    {
LABEL_46:
      if ((v15 & 0x80000) == 0) {
        goto LABEL_47;
      }
      goto LABEL_64;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_46;
  }
  self->_double messageSendTime = *((double *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v15 = *((_DWORD *)v5 + 100);
  if ((v15 & 0x80000) == 0)
  {
LABEL_47:
    if ((v15 & 0x8000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_protoNeedsManualInCallSounds = *((unsigned char *)v5 + 389);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v15 = *((_DWORD *)v5 + 100);
  if ((v15 & 0x8000) == 0)
  {
LABEL_48:
    if ((v15 & 0x20000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_65:
  self->_protoCannotRelayAudioOrVideoOnPairedDevice = *((unsigned char *)v5 + 385);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v5 + 100) & 0x20000) != 0)
  {
LABEL_49:
    self->_protoExpectedEndpointOnMessagingDevice = *((unsigned char *)v5 + 387);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_50:
  if (*((void *)v5 + 4)) {
    -[CSDMessagingRelayMessage setContactIdentifier:](self, "setContactIdentifier:");
  }
  protoCallCapabilitiesState = self->_protoCallCapabilitiesState;
  uint64_t v17 = *((void *)v5 + 26);
  if (protoCallCapabilitiesState)
  {
    if (v17) {
      -[CSDMessagingCallCapabilitiesState mergeFrom:](protoCallCapabilitiesState, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[CSDMessagingRelayMessage setProtoCallCapabilitiesState:](self, "setProtoCallCapabilitiesState:");
  }
  int v18 = *((_DWORD *)v5 + 100);
  if ((v18 & 0x100) != 0)
  {
    self->_protoSoundRegiouint64_t n = *((_DWORD *)v5 + 73);
    *(_DWORD *)&self->_has |= 0x100u;
    int v18 = *((_DWORD *)v5 + 100);
  }
  if ((v18 & 0x10000) != 0)
  {
    self->_protoEmergency = *((unsigned char *)v5 + 386);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v19 = *((id *)v5 + 24);
  id v20 = [v19 countByEnumeratingWithState:&v111 objects:v127 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v112;
    do
    {
      for (uint64_t j = 0; j != v21; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v112 != v22) {
          objc_enumerationMutation(v19);
        }
        [(CSDMessagingRelayMessage *)self addOtherUniqueProxyIdentifiers:*(void *)(*((void *)&v111 + 1) + 8 * (void)j)];
      }
      id v21 = [v19 countByEnumeratingWithState:&v111 objects:v127 count:16];
    }
    while (v21);
  }

  protoCallModel = self->_protoCallModel;
  uint64_t v25 = *((void *)v5 + 27);
  if (protoCallModel)
  {
    if (v25) {
      -[CSDMessagingCallModel mergeFrom:](protoCallModel, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[CSDMessagingRelayMessage setProtoCallModel:](self, "setProtoCallModel:");
  }
  handle = self->_handle;
  uint64_t v27 = *((void *)v5 + 13);
  if (handle)
  {
    if (v27) {
      -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[CSDMessagingRelayMessage setHandle:](self, "setHandle:");
  }
  if ((*((unsigned char *)v5 + 402) & 0x20) != 0)
  {
    self->_protoSOS = *((unsigned char *)v5 + 391);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v28 = *((id *)v5 + 38);
  id v29 = [v28 countByEnumeratingWithState:&v107 objects:v126 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v108;
    do
    {
      for (uint64_t k = 0; k != v30; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v108 != v31) {
          objc_enumerationMutation(v28);
        }
        [(CSDMessagingRelayMessage *)self addProviders:*(void *)(*((void *)&v107 + 1) + 8 * (void)k)];
      }
      id v30 = [v28 countByEnumeratingWithState:&v107 objects:v126 count:16];
    }
    while (v30);
  }

  protoDisplayContext = self->_protoDisplayContext;
  uint64_t v34 = *((void *)v5 + 32);
  if (protoDisplayContext)
  {
    if (v34) {
      -[CSDMessagingCallDisplayContext mergeFrom:](protoDisplayContext, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[CSDMessagingRelayMessage setProtoDisplayContext:](self, "setProtoDisplayContext:");
  }
  inviteData = self->_inviteData;
  uint64_t v36 = *((void *)v5 + 18);
  if (inviteData)
  {
    if (v36) {
      -[CSDMessagingAVConferenceInviteData mergeFrom:](inviteData, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[CSDMessagingRelayMessage setInviteData:](self, "setInviteData:");
  }
  protoProvider = self->_protoProvider;
  uint64_t v38 = *((void *)v5 + 35);
  if (protoProvider)
  {
    if (v38) {
      -[CSDMessagingCallProvider mergeFrom:](protoProvider, "mergeFrom:");
    }
  }
  else if (v38)
  {
    -[CSDMessagingRelayMessage setProtoProvider:](self, "setProtoProvider:");
  }
  int v39 = *((_DWORD *)v5 + 100);
  if ((v39 & 0x8000000) != 0)
  {
    self->_protoVideo = *((unsigned char *)v5 + 397);
    *(_DWORD *)&self->_has |= 0x8000000u;
    int v39 = *((_DWORD *)v5 + 100);
    if ((v39 & 0x4000000) == 0)
    {
LABEL_116:
      if ((v39 & 0x100000) == 0) {
        goto LABEL_117;
      }
      goto LABEL_146;
    }
  }
  else if ((v39 & 0x4000000) == 0)
  {
    goto LABEL_116;
  }
  self->_protoUplinkMuted = *((unsigned char *)v5 + 396);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v39 = *((_DWORD *)v5 + 100);
  if ((v39 & 0x100000) == 0)
  {
LABEL_117:
    if ((v39 & 0x1000) == 0) {
      goto LABEL_119;
    }
    goto LABEL_118;
  }
LABEL_146:
  self->_protoRemoteUplinkMuted = *((unsigned char *)v5 + 390);
  *(_DWORD *)&self->_has |= 0x100000u;
  if ((*((_DWORD *)v5 + 100) & 0x1000) != 0)
  {
LABEL_118:
    self->_float systemVolume = *((float *)v5 + 92);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_119:
  if (*((void *)v5 + 22)) {
    -[CSDMessagingRelayMessage setLocalSenderIdentityUUIDString:](self, "setLocalSenderIdentityUUIDString:");
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v40 = *((id *)v5 + 40);
  id v41 = [v40 countByEnumeratingWithState:&v103 objects:v125 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v104;
    do
    {
      for (uint64_t m = 0; m != v42; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v104 != v43) {
          objc_enumerationMutation(v40);
        }
        [(CSDMessagingRelayMessage *)self addRemoteParticipantHandles:*(void *)(*((void *)&v103 + 1) + 8 * (void)m)];
      }
      id v42 = [v40 countByEnumeratingWithState:&v103 objects:v125 count:16];
    }
    while (v42);
  }

  if (*((void *)v5 + 21)) {
    -[CSDMessagingRelayMessage setLocalSenderIdentityAccountUUIDString:](self, "setLocalSenderIdentityAccountUUIDString:");
  }
  int v45 = *((_DWORD *)v5 + 100);
  if ((v45 & 0x200) != 0)
  {
    self->_protoTTYType = *((_DWORD *)v5 + 74);
    *(_DWORD *)&self->_has |= 0x200u;
    int v45 = *((_DWORD *)v5 + 100);
    if ((v45 & 0x2000000) == 0)
    {
LABEL_132:
      if ((v45 & 0x800) == 0) {
        goto LABEL_134;
      }
      goto LABEL_133;
    }
  }
  else if ((v45 & 0x2000000) == 0)
  {
    goto LABEL_132;
  }
  self->_protoSupportsTTYWithVoice = *((unsigned char *)v5 + 395);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)v5 + 100) & 0x800) != 0)
  {
LABEL_133:
    self->_uint64_t requestActionType = *((_DWORD *)v5 + 82);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_134:
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v46 = *((id *)v5 + 43);
  id v47 = [v46 countByEnumeratingWithState:&v99 objects:v124 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v100;
    do
    {
      for (uint64_t n = 0; n != v48; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v100 != v49) {
          objc_enumerationMutation(v46);
        }
        [(CSDMessagingRelayMessage *)self addRoutes:*(void *)(*((void *)&v99 + 1) + 8 * (void)n)];
      }
      id v48 = [v46 countByEnumeratingWithState:&v99 objects:v124 count:16];
    }
    while (v48);
  }

  route = self->_route;
  uint64_t v52 = *((void *)v5 + 42);
  if (route)
  {
    if (v52) {
      -[CSDMessagingRoute mergeFrom:](route, "mergeFrom:");
    }
  }
  else if (v52)
  {
    [(CSDMessagingRelayMessage *)self setRoute:"setRoute:"];
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v53 = *((id *)v5 + 11);
  id v54 = [v53 countByEnumeratingWithState:&v95 objects:v123 count:16];
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v96;
    do
    {
      for (iuint64_t i = 0; ii != v55; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v96 != v56) {
          objc_enumerationMutation(v53);
        }
        [(CSDMessagingRelayMessage *)self addEndpointIDSDestinationURIs:*(void *)(*((void *)&v95 + 1) + 8 * (void)ii)];
      }
      id v55 = [v53 countByEnumeratingWithState:&v95 objects:v123 count:16];
    }
    while (v55);
  }

  if (*((void *)v5 + 19)) {
    -[CSDMessagingRelayMessage setIsoCountryCode:](self, "setIsoCountryCode:");
  }
  int v58 = *((_DWORD *)v5 + 100);
  if ((v58 & 0x20) != 0)
  {
    self->_protoPriority = *((_DWORD *)v5 + 67);
    *(_DWORD *)&self->_has |= 0x20u;
    int v58 = *((_DWORD *)v5 + 100);
    if ((v58 & 0x10) == 0)
    {
LABEL_164:
      if ((v58 & 0x40000) == 0) {
        goto LABEL_165;
      }
      goto LABEL_212;
    }
  }
  else if ((v58 & 0x10) == 0)
  {
    goto LABEL_164;
  }
  self->_protoOriginatingUIType = *((_DWORD *)v5 + 66);
  *(_DWORD *)&self->_has |= 0x10u;
  int v58 = *((_DWORD *)v5 + 100);
  if ((v58 & 0x40000) == 0)
  {
LABEL_165:
    if ((v58 & 0x1000000) == 0) {
      goto LABEL_167;
    }
    goto LABEL_166;
  }
LABEL_212:
  self->_protoFailureExpected = *((unsigned char *)v5 + 388);
  *(_DWORD *)&self->_has |= 0x40000u;
  if ((*((_DWORD *)v5 + 100) & 0x1000000) != 0)
  {
LABEL_166:
    self->_protoSupportsEmergencyFallbacuint64_t k = *((unsigned char *)v5 + 394);
    *(_DWORD *)&self->_has |= 0x1000000u;
  }
LABEL_167:
  if (*((void *)v5 + 12)) {
    -[CSDMessagingRelayMessage setGroupUUIDString:](self, "setGroupUUIDString:");
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v59 = *((id *)v5 + 7);
  id v60 = [v59 countByEnumeratingWithState:&v91 objects:v122 count:16];
  if (v60)
  {
    id v61 = v60;
    uint64_t v62 = *(void *)v92;
    do
    {
      for (juint64_t j = 0; jj != v61; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v92 != v62) {
          objc_enumerationMutation(v59);
        }
        [(CSDMessagingRelayMessage *)self addConversations:*(void *)(*((void *)&v91 + 1) + 8 * (void)jj)];
      }
      id v61 = [v59 countByEnumeratingWithState:&v91 objects:v122 count:16];
    }
    while (v61);
  }

  if (*((void *)v5 + 20)) {
    -[CSDMessagingRelayMessage setJoinConversationRequestURLString:](self, "setJoinConversationRequestURLString:");
  }
  if (*((void *)v5 + 6)) {
    -[CSDMessagingRelayMessage setConversationUUIDString:](self, "setConversationUUIDString:");
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v64 = *((id *)v5 + 5);
  id v65 = [v64 countByEnumeratingWithState:&v87 objects:v121 count:16];
  if (v65)
  {
    id v66 = v65;
    uint64_t v67 = *(void *)v88;
    do
    {
      for (kuint64_t k = 0; kk != v66; kuint64_t k = (char *)kk + 1)
      {
        if (*(void *)v88 != v67) {
          objc_enumerationMutation(v64);
        }
        [(CSDMessagingRelayMessage *)self addConversationMembers:*(void *)(*((void *)&v87 + 1) + 8 * (void)kk)];
      }
      id v66 = [v64 countByEnumeratingWithState:&v87 objects:v121 count:16];
    }
    while (v66);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v69 = *((id *)v5 + 14);
  id v70 = [v69 countByEnumeratingWithState:&v83 objects:v120 count:16];
  if (v70)
  {
    id v71 = v70;
    uint64_t v72 = *(void *)v84;
    do
    {
      for (muint64_t m = 0; mm != v71; muint64_t m = (char *)mm + 1)
      {
        if (*(void *)v84 != v72) {
          objc_enumerationMutation(v69);
        }
        [(CSDMessagingRelayMessage *)self addHandlesToInvite:*(void *)(*((void *)&v83 + 1) + 8 * (void)mm)];
      }
      id v71 = [v69 countByEnumeratingWithState:&v83 objects:v120 count:16];
    }
    while (v71);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v74 = *((id *)v5 + 25);
  id v75 = [v74 countByEnumeratingWithState:&v79 objects:v119 count:16];
  if (v75)
  {
    id v76 = v75;
    uint64_t v77 = *(void *)v80;
    do
    {
      for (nuint64_t n = 0; nn != v76; nuint64_t n = (char *)nn + 1)
      {
        if (*(void *)v80 != v77) {
          objc_enumerationMutation(v74);
        }
        -[CSDMessagingRelayMessage addProminenceEntry:](self, "addProminenceEntry:", *(void *)(*((void *)&v79 + 1) + 8 * (void)nn), (void)v79);
      }
      id v76 = [v74 countByEnumeratingWithState:&v79 objects:v119 count:16];
    }
    while (v76);
  }

  if ((*((unsigned char *)v5 + 402) & 0x80) != 0)
  {
    self->_protoSupportsDTMFUpdates = *((unsigned char *)v5 + 393);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
  if (*((void *)v5 + 9)) {
    -[CSDMessagingRelayMessage setDtmfUpdateDigits:](self, "setDtmfUpdateDigits:");
  }
  if (*((void *)v5 + 17)) {
    -[CSDMessagingRelayMessage setImage:](self, "setImage:");
  }
  if (*((void *)v5 + 44)) {
    -[CSDMessagingRelayMessage setSenderIDSIdentifier:](self, "setSenderIDSIdentifier:");
  }
}

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (void)setUniqueProxyIdentifier:(id)a3
{
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (void)setDestinationID:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (CSDMessagingCallModelState)protoCallModelState
{
  return self->_protoCallModelState;
}

- (void)setProtoCallModelState:(id)a3
{
}

- (unsigned)protoService
{
  return self->_protoService;
}

- (BOOL)protoWantsHoldMusic
{
  return self->_protoWantsHoldMusic;
}

- (BOOL)protoCannotBeAnswered
{
  return self->_protoCannotBeAnswered;
}

- (NSData)protoDTMFKey
{
  return self->_protoDTMFKey;
}

- (void)setProtoDTMFKey:(id)a3
{
}

- (unsigned)protoDisconnectedReason
{
  return self->_protoDisconnectedReason;
}

- (NSString)oBSOLETEConferenceIdentifier
{
  return self->_oBSOLETEConferenceIdentifier;
}

- (void)setOBSOLETEConferenceIdentifier:(id)a3
{
}

- (BOOL)protoVoicemail
{
  return self->_protoVoicemail;
}

- (NSString)callerNameFromNetwork
{
  return self->_callerNameFromNetwork;
}

- (void)setCallerNameFromNetwork:(id)a3
{
}

- (NSMutableArray)protoCalls
{
  return self->_protoCalls;
}

- (void)setProtoCalls:(id)a3
{
}

- (NSString)hardPauseDigits
{
  return self->_hardPauseDigits;
}

- (void)setHardPauseDigits:(id)a3
{
}

- (unsigned)hardPauseState
{
  return self->_hardPauseState;
}

- (unsigned)protoProtocolVersion
{
  return self->_protoProtocolVersion;
}

- (BOOL)protoShouldSuppressRingtone
{
  return self->_protoShouldSuppressRingtone;
}

- (NSData)dummyPayload
{
  return self->_dummyPayload;
}

- (void)setDummyPayload:(id)a3
{
}

- (double)hostCallCreationTime
{
  return self->_hostCallCreationTime;
}

- (double)messageSendTime
{
  return self->_messageSendTime;
}

- (BOOL)protoNeedsManualInCallSounds
{
  return self->_protoNeedsManualInCallSounds;
}

- (BOOL)protoCannotRelayAudioOrVideoOnPairedDevice
{
  return self->_protoCannotRelayAudioOrVideoOnPairedDevice;
}

- (BOOL)protoExpectedEndpointOnMessagingDevice
{
  return self->_protoExpectedEndpointOnMessagingDevice;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (CSDMessagingCallCapabilitiesState)protoCallCapabilitiesState
{
  return self->_protoCallCapabilitiesState;
}

- (void)setProtoCallCapabilitiesState:(id)a3
{
}

- (unsigned)protoSoundRegion
{
  return self->_protoSoundRegion;
}

- (BOOL)protoEmergency
{
  return self->_protoEmergency;
}

- (NSMutableArray)otherUniqueProxyIdentifiers
{
  return self->_otherUniqueProxyIdentifiers;
}

- (void)setOtherUniqueProxyIdentifiers:(id)a3
{
}

- (CSDMessagingCallModel)protoCallModel
{
  return self->_protoCallModel;
}

- (void)setProtoCallModel:(id)a3
{
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (BOOL)protoSOS
{
  return self->_protoSOS;
}

- (NSMutableArray)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (CSDMessagingCallDisplayContext)protoDisplayContext
{
  return self->_protoDisplayContext;
}

- (void)setProtoDisplayContext:(id)a3
{
}

- (CSDMessagingAVConferenceInviteData)inviteData
{
  return self->_inviteData;
}

- (void)setInviteData:(id)a3
{
}

- (CSDMessagingCallProvider)protoProvider
{
  return self->_protoProvider;
}

- (void)setProtoProvider:(id)a3
{
}

- (BOOL)protoVideo
{
  return self->_protoVideo;
}

- (BOOL)protoUplinkMuted
{
  return self->_protoUplinkMuted;
}

- (BOOL)protoRemoteUplinkMuted
{
  return self->_protoRemoteUplinkMuted;
}

- (float)systemVolume
{
  return self->_systemVolume;
}

- (NSString)localSenderIdentityUUIDString
{
  return self->_localSenderIdentityUUIDString;
}

- (void)setLocalSenderIdentityUUIDString:(id)a3
{
}

- (NSMutableArray)remoteParticipantHandles
{
  return self->_remoteParticipantHandles;
}

- (void)setRemoteParticipantHandles:(id)a3
{
}

- (NSString)localSenderIdentityAccountUUIDString
{
  return self->_localSenderIdentityAccountUUIDString;
}

- (void)setLocalSenderIdentityAccountUUIDString:(id)a3
{
}

- (unsigned)protoTTYType
{
  return self->_protoTTYType;
}

- (BOOL)protoSupportsTTYWithVoice
{
  return self->_protoSupportsTTYWithVoice;
}

- (NSMutableArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
}

- (CSDMessagingRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (NSMutableArray)endpointIDSDestinationURIs
{
  return self->_endpointIDSDestinationURIs;
}

- (void)setEndpointIDSDestinationURIs:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (unsigned)protoPriority
{
  return self->_protoPriority;
}

- (unsigned)protoOriginatingUIType
{
  return self->_protoOriginatingUIType;
}

- (BOOL)protoFailureExpected
{
  return self->_protoFailureExpected;
}

- (BOOL)protoSupportsEmergencyFallback
{
  return self->_protoSupportsEmergencyFallback;
}

- (NSString)groupUUIDString
{
  return self->_groupUUIDString;
}

- (void)setGroupUUIDString:(id)a3
{
}

- (NSMutableArray)conversations
{
  return self->_conversations;
}

- (void)setConversations:(id)a3
{
}

- (NSString)joinConversationRequestURLString
{
  return self->_joinConversationRequestURLString;
}

- (void)setJoinConversationRequestURLString:(id)a3
{
}

- (NSString)conversationUUIDString
{
  return self->_conversationUUIDString;
}

- (void)setConversationUUIDString:(id)a3
{
}

- (NSMutableArray)conversationMembers
{
  return self->_conversationMembers;
}

- (void)setConversationMembers:(id)a3
{
}

- (NSMutableArray)handlesToInvites
{
  return self->_handlesToInvites;
}

- (void)setHandlesToInvites:(id)a3
{
}

- (NSMutableArray)prominenceEntrys
{
  return self->_prominenceEntrys;
}

- (void)setProminenceEntrys:(id)a3
{
}

- (BOOL)protoSupportsDTMFUpdates
{
  return self->_protoSupportsDTMFUpdates;
}

- (NSString)dtmfUpdateDigits
{
  return self->_dtmfUpdateDigits;
}

- (void)setDtmfUpdateDigits:(id)a3
{
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)senderIDSIdentifier
{
  return self->_senderIDSIdentifier;
}

- (void)setSenderIDSIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueProxyIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_senderIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_protoProvider, 0);
  objc_storeStrong((id *)&self->_protoDisplayContext, 0);
  objc_storeStrong((id *)&self->_protoDTMFKey, 0);
  objc_storeStrong((id *)&self->_protoCalls, 0);
  objc_storeStrong((id *)&self->_protoCallModelState, 0);
  objc_storeStrong((id *)&self->_protoCallModel, 0);
  objc_storeStrong((id *)&self->_protoCallCapabilitiesState, 0);
  objc_storeStrong((id *)&self->_prominenceEntrys, 0);
  objc_storeStrong((id *)&self->_otherUniqueProxyIdentifiers, 0);
  objc_storeStrong((id *)&self->_oBSOLETEConferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUIDString, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityAccountUUIDString, 0);
  objc_storeStrong((id *)&self->_joinConversationRequestURLString, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_inviteData, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_hardPauseDigits, 0);
  objc_storeStrong((id *)&self->_handlesToInvites, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_groupUUIDString, 0);
  objc_storeStrong((id *)&self->_endpointIDSDestinationURIs, 0);
  objc_storeStrong((id *)&self->_dummyPayload, 0);
  objc_storeStrong((id *)&self->_dtmfUpdateDigits, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_conversations, 0);
  objc_storeStrong((id *)&self->_conversationUUIDString, 0);
  objc_storeStrong((id *)&self->_conversationMembers, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);

  objc_storeStrong((id *)&self->_callerNameFromNetwork, 0);
}

@end