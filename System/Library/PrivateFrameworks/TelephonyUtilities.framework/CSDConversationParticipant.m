@interface CSDConversationParticipant
- (BOOL)isAudioEnabled;
- (BOOL)isAudioPaused;
- (BOOL)isCameraMixedWithScreen;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToParticipant:(id)a3;
- (BOOL)isGuestModeEnabled;
- (BOOL)isLightweight;
- (BOOL)isLocalAccountHandle;
- (BOOL)isMuted;
- (BOOL)isPseudonym;
- (BOOL)isScreenEnabled;
- (BOOL)isSpatialPersonaEnabled;
- (BOOL)isVideoEnabled;
- (BOOL)pseudonym;
- (CSDConversationParticipant)initWithIDSDictionaryRepresentation:(id)a3;
- (CSDConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 avcData:(id)a5;
- (CSDConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 avcData:(id)a5 senderCorrelationIdentifier:(id)a6;
- (NSData)avcData;
- (NSDictionary)idsDictionaryRepresentation;
- (NSString)activeIDSDestination;
- (NSString)avcIdentifier;
- (NSString)senderCorrelationIdentifier;
- (TUConversationParticipant)tuConversationParticipant;
- (TUConversationParticipantAssociation)association;
- (TUConversationParticipantCapabilities)capabilities;
- (TUHandle)handle;
- (id)description;
- (int64_t)audioPriority;
- (int64_t)captionsToken;
- (int64_t)screenToken;
- (int64_t)streamToken;
- (int64_t)videoPriority;
- (unint64_t)audioVideoMode;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)presentationMode;
- (unint64_t)spatialPersonaGenerationCounter;
- (void)setActiveIDSDestination:(id)a3;
- (void)setAssociation:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setAudioPriority:(int64_t)a3;
- (void)setAudioVideoMode:(unint64_t)a3;
- (void)setAvcIdentifier:(id)a3;
- (void)setCameraMixedWithScreen:(BOOL)a3;
- (void)setCapabilities:(id)a3;
- (void)setCaptionsToken:(int64_t)a3;
- (void)setGuestModeEnabled:(BOOL)a3;
- (void)setLightweight:(BOOL)a3;
- (void)setLocalAccountHandle:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setScreenEnabled:(BOOL)a3;
- (void)setScreenToken:(int64_t)a3;
- (void)setSpatialPersonaEnabled:(BOOL)a3;
- (void)setSpatialPersonaGenerationCounter:(unint64_t)a3;
- (void)setStreamToken:(int64_t)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPriority:(int64_t)a3;
@end

@implementation CSDConversationParticipant

- (CSDConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 avcData:(id)a5 senderCorrelationIdentifier:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CSDConversationParticipant;
  v13 = [(CSDConversationParticipant *)&v26 init];
  v14 = v13;
  if (v13)
  {
    v13->_identifier = a3;
    objc_storeStrong((id *)&v13->_avcData, a5);
    v15 = [v10 normalizedValue];
    id v16 = [v15 length];

    if (v16)
    {
      v17 = (TUHandle *)[v10 copy];
      handle = v14->_handle;
      v14->_handle = v17;
    }
    else
    {
      handle = TUNormalizedHandleForTUHandle();
      v19 = (TUHandle *)[handle copy];
      v20 = v14->_handle;
      v14->_handle = v19;
    }
    v21 = (TUConversationParticipantCapabilities *)objc_alloc_init((Class)TUConversationParticipantCapabilities);
    capabilities = v14->_capabilities;
    v14->_capabilities = v21;

    v23 = (NSString *)[v12 copy];
    senderCorrelationIdentifier = v14->_senderCorrelationIdentifier;
    v14->_senderCorrelationIdentifier = v23;
  }
  return v14;
}

- (CSDConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 avcData:(id)a5
{
  return [(CSDConversationParticipant *)self initWithIdentifier:a3 handle:a4 avcData:a5 senderCorrelationIdentifier:0];
}

- (CSDConversationParticipant)initWithIDSDictionaryRepresentation:(id)a3
{
  uint64_t v4 = IDSSessionParticipantIDKey;
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:v4];
  v7 = (CSDConversationParticipant *)[v6 unsignedLongLongValue];

  v8 = [v5 objectForKeyedSubscript:IDSSessionParticipantDataKey];

  v9 = [[CSDMessagingConversationParticipant alloc] initWithData:v8];
  id v10 = v9;
  if (v7)
  {
    uint64_t v11 = [(CSDMessagingConversationParticipant *)v9 handle];
    if (v11
      && (id v12 = (void *)v11,
          [(CSDMessagingConversationParticipant *)v10 avcData],
          v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13))
    {
      v14 = [(CSDMessagingConversationParticipant *)v10 csdConversationParticipant];
      v15 = [(CSDConversationParticipant *)v14 handle];
      id v16 = [(CSDMessagingConversationParticipant *)v10 avcData];
      v7 = [(CSDConversationParticipant *)self initWithIdentifier:v7 handle:v15 avcData:v16 senderCorrelationIdentifier:0];

      self = v14;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" identifier=%llu", -[CSDConversationParticipant identifier](self, "identifier"));
  uint64_t v4 = [(CSDConversationParticipant *)self handle];
  [v3 appendFormat:@" handle=%@", v4];

  id v5 = [(CSDConversationParticipant *)self avcData];
  CFStringRef v6 = @"YES";
  if (!v5) {
    CFStringRef v6 = @"NO";
  }
  [v3 appendFormat:@" hasAVCData=%@", v6];

  objc_msgSend(v3, "appendFormat:", @" isMuted=%d", -[CSDConversationParticipant isMuted](self, "isMuted"));
  objc_msgSend(v3, "appendFormat:", @" isAudioEnabled=%d", -[CSDConversationParticipant isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend(v3, "appendFormat:", @" isVideoEnabled=%d", -[CSDConversationParticipant isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v3, "appendFormat:", @" isScreenEnabled=%d", -[CSDConversationParticipant isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend(v3, "appendFormat:", @" streamToken=%ld", -[CSDConversationParticipant streamToken](self, "streamToken"));
  objc_msgSend(v3, "appendFormat:", @" screenToken=%ld", -[CSDConversationParticipant screenToken](self, "screenToken"));
  objc_msgSend(v3, "appendFormat:", @" captionsToken=%ld", -[CSDConversationParticipant captionsToken](self, "captionsToken"));
  v7 = [(CSDConversationParticipant *)self avcIdentifier];
  [v3 appendFormat:@" avcIdentifier=%@", v7];

  v8 = [(CSDConversationParticipant *)self capabilities];
  [v3 appendFormat:@" capabilities=%@", v8];

  objc_msgSend(v3, "appendFormat:", @" isAudioPaused=%d", -[CSDConversationParticipant isAudioPaused](self, "isAudioPaused"));
  objc_msgSend(v3, "appendFormat:", @" isLightweight=%d", -[CSDConversationParticipant isLightweight](self, "isLightweight"));
  objc_msgSend(v3, "appendFormat:", @" isLocalAccountHandle=%d", -[CSDConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle"));
  v9 = [(CSDConversationParticipant *)self association];

  if (v9)
  {
    id v10 = [(CSDConversationParticipant *)self association];
    [v3 appendFormat:@" association=%@", v10];
  }
  objc_msgSend(v3, "appendFormat:", @" isGuestModeEnabled=%d", -[CSDConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled"));
  uint64_t v11 = [(CSDConversationParticipant *)self senderCorrelationIdentifier];

  if (v11)
  {
    id v12 = [(CSDConversationParticipant *)self senderCorrelationIdentifier];
    [v3 appendFormat:@" senderCorrelationIdentifier=%@", v12];
  }
  objc_msgSend(v3, "appendFormat:", @" audioPriority=%lu", -[CSDConversationParticipant audioPriority](self, "audioPriority"));
  objc_msgSend(v3, "appendFormat:", @" avMode=%ld", -[CSDConversationParticipant audioVideoMode](self, "audioVideoMode"));
  objc_msgSend(v3, "appendFormat:", @" presentationMode=%ld", -[CSDConversationParticipant presentationMode](self, "presentationMode"));
  if ([(CSDConversationParticipant *)self isSpatialPersonaEnabled]) {
    objc_msgSend(v3, "appendFormat:", @" isSpatialPersonaEnabled=%d", -[CSDConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  }
  if ([(CSDConversationParticipant *)self isCameraMixedWithScreen]) {
    objc_msgSend(v3, "appendFormat:", @" isCameraMixedWithScreen=%d", -[CSDConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  }
  [v3 appendString:@">"];
  id v13 = [v3 copy];

  return v13;
}

- (TUConversationParticipant)tuConversationParticipant
{
  id v3 = objc_alloc((Class)TUConversationParticipant);
  unint64_t v4 = [(CSDConversationParticipant *)self identifier];
  id v5 = [(CSDConversationParticipant *)self handle];
  CFStringRef v6 = [(CSDConversationParticipant *)self senderCorrelationIdentifier];
  id v7 = [v3 initWithIdentifier:v4 handle:v5 senderCorrelationIdentifier:v6];

  objc_msgSend(v7, "setMuted:", -[CSDConversationParticipant isMuted](self, "isMuted"));
  objc_msgSend(v7, "setAudioEnabled:", -[CSDConversationParticipant isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend(v7, "setVideoEnabled:", -[CSDConversationParticipant isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v7, "setScreenEnabled:", -[CSDConversationParticipant isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend(v7, "setAudioPaused:", -[CSDConversationParticipant isAudioPaused](self, "isAudioPaused"));
  objc_msgSend(v7, "setStreamToken:", -[CSDConversationParticipant streamToken](self, "streamToken"));
  objc_msgSend(v7, "setScreenToken:", -[CSDConversationParticipant screenToken](self, "screenToken"));
  objc_msgSend(v7, "setCaptionsToken:", -[CSDConversationParticipant captionsToken](self, "captionsToken"));
  objc_msgSend(v7, "setAudioPriority:", -[CSDConversationParticipant audioPriority](self, "audioPriority"));
  objc_msgSend(v7, "setVideoPriority:", -[CSDConversationParticipant videoPriority](self, "videoPriority"));
  v8 = [(CSDConversationParticipant *)self avcIdentifier];
  [v7 setAvcIdentifier:v8];

  v9 = [(CSDConversationParticipant *)self activeIDSDestination];
  [v7 setActiveIDSDestination:v9];

  id v10 = [(CSDConversationParticipant *)self capabilities];
  [v7 setCapabilities:v10];

  objc_msgSend(v7, "setLightweight:", -[CSDConversationParticipant isLightweight](self, "isLightweight"));
  objc_msgSend(v7, "setLocalAccountHandle:", -[CSDConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle"));
  uint64_t v11 = [(CSDConversationParticipant *)self association];
  [v7 setAssociation:v11];

  objc_msgSend(v7, "setGuestModeEnabled:", -[CSDConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled"));
  objc_msgSend(v7, "setAudioVideoMode:", -[CSDConversationParticipant audioVideoMode](self, "audioVideoMode"));
  objc_msgSend(v7, "setPresentationMode:", -[CSDConversationParticipant presentationMode](self, "presentationMode"));
  objc_msgSend(v7, "setSpatialPersonaEnabled:", -[CSDConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  objc_msgSend(v7, "setCameraMixedWithScreen:", -[CSDConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));

  return (TUConversationParticipant *)v7;
}

- (NSDictionary)idsDictionaryRepresentation
{
  id v3 = +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:self];
  v10[0] = IDSSessionParticipantIDKey;
  unint64_t v4 = +[NSNumber numberWithUnsignedLongLong:[(CSDConversationParticipant *)self identifier]];
  v11[0] = v4;
  v10[1] = IDSSessionParticipantDataKey;
  id v5 = [v3 data];
  v11[1] = v5;
  v10[2] = IDSGroupSessionMessagesLocalMemberIDKey;
  CFStringRef v6 = [(CSDConversationParticipant *)self handle];
  id v7 = TUCopyIDSCanonicalAddressForHandle();
  v11[2] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return (NSDictionary *)v8;
}

- (BOOL)pseudonym
{
  v2 = [(CSDConversationParticipant *)self handle];
  id v3 = [v2 value];
  unsigned __int8 v4 = [v3 destinationIdIsPseudonym];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(CSDConversationParticipant *)self isEqualToParticipant:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToParticipant:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationParticipant *)self identifier];
  if (v5 == [v4 identifier])
  {
    CFStringRef v6 = [(CSDConversationParticipant *)self handle];
    id v7 = [v4 handle];
    if ([v6 isEqualToHandle:v7])
    {
      v8 = [(CSDConversationParticipant *)self avcData];
      v9 = [v4 avcData];
      if ([v8 isEqualToData:v9]
        && (unsigned int v10 = [(CSDConversationParticipant *)self isMuted],
            v10 == [v4 isMuted])
        && (unsigned int v11 = [(CSDConversationParticipant *)self isAudioEnabled],
            v11 == [v4 isAudioEnabled])
        && (unsigned int v12 = [(CSDConversationParticipant *)self isVideoEnabled],
            v12 == [v4 isVideoEnabled])
        && (unsigned int v13 = [(CSDConversationParticipant *)self isScreenEnabled],
            v13 == [v4 isScreenEnabled])
        && (id v14 = -[CSDConversationParticipant streamToken](self, "streamToken"), v14 == [v4 streamToken])
        && (id v15 = -[CSDConversationParticipant screenToken](self, "screenToken"), v15 == [v4 screenToken])
        && (id v16 = [(CSDConversationParticipant *)self captionsToken],
            v16 == [v4 captionsToken]))
      {
        v17 = [(CSDConversationParticipant *)self avcIdentifier];
        v18 = [v4 avcIdentifier];
        if (v17 == v18)
        {
          v21 = [(CSDConversationParticipant *)self activeIDSDestination];
          v22 = [v4 activeIDSDestination];
          if (TUStringsAreEqualOrNil())
          {
            v39 = v22;
            uint64_t v23 = [(CSDConversationParticipant *)self capabilities];
            uint64_t v24 = [v4 capabilities];
            v40 = (void *)v23;
            v25 = (void *)v23;
            objc_super v26 = (void *)v24;
            if ([v25 isEqualToCapabilities:v24])
            {
              v38 = v21;
              unsigned int v27 = [(CSDConversationParticipant *)self isAudioPaused];
              if (v27 == [v4 isAudioPaused]
                && (unsigned int v28 = [(CSDConversationParticipant *)self isLocalAccountHandle],
                    v28 == [v4 isLocalAccountHandle])
                && (unsigned int v29 = [(CSDConversationParticipant *)self isLightweight],
                    v29 == [v4 isLightweight]))
              {
                uint64_t v30 = [(CSDConversationParticipant *)self association];
                v36 = [v4 association];
                v37 = (void *)v30;
                if (TUObjectsAreEqualOrNil()
                  && (id v31 = [(CSDConversationParticipant *)self presentationMode],
                      v31 == [v4 presentationMode])
                  && (unsigned int v32 = [(CSDConversationParticipant *)self isGuestModeEnabled],
                      v32 == [v4 isGuestModeEnabled])
                  && (unsigned int v33 = [(CSDConversationParticipant *)self isSpatialPersonaEnabled],
                      v33 == [v4 isSpatialPersonaEnabled])
                  && (id v34 = -[CSDConversationParticipant spatialPersonaGenerationCounter](self, "spatialPersonaGenerationCounter"), v34 == [v4 spatialPersonaGenerationCounter]))
                {
                  unsigned int v35 = [(CSDConversationParticipant *)self isCameraMixedWithScreen];
                  unsigned int v19 = v35 ^ [v4 isCameraMixedWithScreen] ^ 1;
                }
                else
                {
                  LOBYTE(v19) = 0;
                }
              }
              else
              {
                LOBYTE(v19) = 0;
              }
              v21 = v38;
            }
            else
            {
              LOBYTE(v19) = 0;
            }

            v22 = v39;
          }
          else
          {
            LOBYTE(v19) = 0;
          }
        }
        else
        {
          LOBYTE(v19) = 0;
        }
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  v39 = +[NSNumber numberWithUnsignedLongLong:[(CSDConversationParticipant *)self identifier]];
  unint64_t v3 = (unint64_t)[v39 hash];
  v38 = [(CSDConversationParticipant *)self handle];
  unint64_t v4 = (unint64_t)[v38 hash];
  id v5 = [(CSDConversationParticipant *)self avcData];
  unint64_t v6 = v4 ^ (unint64_t)[v5 hash];
  if ([(CSDConversationParticipant *)self isMuted]) {
    uint64_t v7 = 1231;
  }
  else {
    uint64_t v7 = 1237;
  }
  unint64_t v8 = v6 ^ v7;
  if ([(CSDConversationParticipant *)self isAudioEnabled]) {
    uint64_t v9 = 1231;
  }
  else {
    uint64_t v9 = 1237;
  }
  uint64_t v10 = v8 ^ v9;
  if ([(CSDConversationParticipant *)self isVideoEnabled]) {
    uint64_t v11 = 1231;
  }
  else {
    uint64_t v11 = 1237;
  }
  uint64_t v12 = v10 ^ v11;
  if ([(CSDConversationParticipant *)self isScreenEnabled]) {
    uint64_t v13 = 1231;
  }
  else {
    uint64_t v13 = 1237;
  }
  unint64_t v14 = v12 ^ v13 ^ v3;
  int64_t v15 = [(CSDConversationParticipant *)self streamToken];
  unint64_t v16 = v15 ^ [(CSDConversationParticipant *)self screenToken];
  unint64_t v17 = v16 ^ [(CSDConversationParticipant *)self captionsToken];
  v18 = [(CSDConversationParticipant *)self avcIdentifier];
  unint64_t v19 = v17 ^ (unint64_t)[v18 hash];
  v20 = [(CSDConversationParticipant *)self activeIDSDestination];
  unint64_t v21 = v19 ^ (unint64_t)[v20 hash];
  v22 = [(CSDConversationParticipant *)self capabilities];
  unint64_t v23 = v21 ^ (unint64_t)[v22 hash];
  if ([(CSDConversationParticipant *)self isAudioPaused]) {
    uint64_t v24 = 1231;
  }
  else {
    uint64_t v24 = 1237;
  }
  unint64_t v25 = v23 ^ v24;
  if ([(CSDConversationParticipant *)self isLightweight]) {
    uint64_t v26 = 1231;
  }
  else {
    uint64_t v26 = 1237;
  }
  uint64_t v27 = v14 ^ v25 ^ v26;
  if ([(CSDConversationParticipant *)self isLocalAccountHandle]) {
    uint64_t v28 = 1231;
  }
  else {
    uint64_t v28 = 1237;
  }
  unsigned int v29 = [(CSDConversationParticipant *)self association];
  unint64_t v30 = v28 ^ (unint64_t)[v29 hash];
  if ([(CSDConversationParticipant *)self isGuestModeEnabled]) {
    uint64_t v31 = 1231;
  }
  else {
    uint64_t v31 = 1237;
  }
  unint64_t v32 = v30 ^ v31;
  if ([(CSDConversationParticipant *)self isSpatialPersonaEnabled]) {
    uint64_t v33 = 1231;
  }
  else {
    uint64_t v33 = 1237;
  }
  uint64_t v34 = v32 ^ v33;
  if ([(CSDConversationParticipant *)self isCameraMixedWithScreen]) {
    uint64_t v35 = 1231;
  }
  else {
    uint64_t v35 = 1237;
  }
  unint64_t v36 = v27 ^ v34 ^ v35 ^ [(CSDConversationParticipant *)self presentationMode];

  return v36;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSData)avcData
{
  return self->_avcData;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isScreenEnabled
{
  return self->_screenEnabled;
}

- (void)setScreenEnabled:(BOOL)a3
{
  self->_screenEnabled = a3;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)isAudioPaused
{
  return self->_audioPaused;
}

- (void)setAudioPaused:(BOOL)a3
{
  self->_audioPaused = a3;
}

- (TUConversationParticipantCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BOOL)isLightweight
{
  return self->_lightweight;
}

- (void)setLightweight:(BOOL)a3
{
  self->_lightweight = a3;
}

- (unint64_t)audioVideoMode
{
  return self->_audioVideoMode;
}

- (void)setAudioVideoMode:(unint64_t)a3
{
  self->_audioVideoMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  self->_spatialPersonaEnabled = a3;
}

- (unint64_t)spatialPersonaGenerationCounter
{
  return self->_spatialPersonaGenerationCounter;
}

- (void)setSpatialPersonaGenerationCounter:(unint64_t)a3
{
  self->_spatialPersonaGenerationCounter = a3;
}

- (BOOL)isCameraMixedWithScreen
{
  return self->_cameraMixedWithScreen;
}

- (void)setCameraMixedWithScreen:(BOOL)a3
{
  self->_cameraMixedWithScreen = a3;
}

- (BOOL)isLocalAccountHandle
{
  return self->_localAccountHandle;
}

- (void)setLocalAccountHandle:(BOOL)a3
{
  self->_localAccountHandle = a3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (void)setStreamToken:(int64_t)a3
{
  self->_streamToken = a3;
}

- (int64_t)screenToken
{
  return self->_screenToken;
}

- (void)setScreenToken:(int64_t)a3
{
  self->_screenToken = a3;
}

- (int64_t)captionsToken
{
  return self->_captionsToken;
}

- (void)setCaptionsToken:(int64_t)a3
{
  self->_captionsToken = a3;
}

- (int64_t)audioPriority
{
  return self->_audioPriority;
}

- (void)setAudioPriority:(int64_t)a3
{
  self->_audioPriority = a3;
}

- (int64_t)videoPriority
{
  return self->_videoPriority;
}

- (void)setVideoPriority:(int64_t)a3
{
  self->_videoPriority = a3;
}

- (NSString)avcIdentifier
{
  return self->_avcIdentifier;
}

- (void)setAvcIdentifier:(id)a3
{
}

- (NSString)activeIDSDestination
{
  return self->_activeIDSDestination;
}

- (void)setActiveIDSDestination:(id)a3
{
}

- (TUConversationParticipantAssociation)association
{
  return self->_association;
}

- (void)setAssociation:(id)a3
{
}

- (BOOL)isPseudonym
{
  return self->_pseudonym;
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (BOOL)isGuestModeEnabled
{
  return self->_guestModeEnabled;
}

- (void)setGuestModeEnabled:(BOOL)a3
{
  self->_guestModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_association, 0);
  objc_storeStrong((id *)&self->_activeIDSDestination, 0);
  objc_storeStrong((id *)&self->_avcIdentifier, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_avcData, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end