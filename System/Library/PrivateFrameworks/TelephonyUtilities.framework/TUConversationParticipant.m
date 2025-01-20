@interface TUConversationParticipant
+ (BOOL)supportsSecureCoding;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioPaused;
- (BOOL)isCameraMixedWithScreen;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToParticipant:(id)a3;
- (BOOL)isGuestModeEnabled;
- (BOOL)isLightweight;
- (BOOL)isLocalAccountHandle;
- (BOOL)isMuted;
- (BOOL)isScreenEnabled;
- (BOOL)isSpatialPersonaEnabled;
- (BOOL)isVideoEnabled;
- (NSString)activeIDSDestination;
- (NSString)avcIdentifier;
- (NSString)senderCorrelationIdentifier;
- (TUConversationParticipant)initWithCoder:(id)a3;
- (TUConversationParticipant)initWithConversationParticipant:(id)a3;
- (TUConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4;
- (TUConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 senderCorrelationIdentifier:(id)a5;
- (TUConversationParticipantAssociation)association;
- (TUConversationParticipantCapabilities)capabilities;
- (TUHandle)handle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)audioPriority;
- (int64_t)captionsToken;
- (int64_t)screenToken;
- (int64_t)streamToken;
- (int64_t)videoPriority;
- (unint64_t)audioVideoMode;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)presentationMode;
- (void)encodeWithCoder:(id)a3;
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
- (void)setStreamToken:(int64_t)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPriority:(int64_t)a3;
@end

@implementation TUConversationParticipant

- (TUConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4 senderCorrelationIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TUConversationParticipant;
  v11 = [(TUConversationParticipant *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_identifier = a3;
    objc_storeStrong((id *)&v11->_handle, a4);
    v13 = objc_alloc_init(TUConversationParticipantCapabilities);
    capabilities = v12->_capabilities;
    v12->_capabilities = v13;

    uint64_t v15 = [v10 copy];
    senderCorrelationIdentifier = v12->_senderCorrelationIdentifier;
    v12->_senderCorrelationIdentifier = (NSString *)v15;
  }
  return v12;
}

- (TUConversationParticipant)initWithIdentifier:(unint64_t)a3 handle:(id)a4
{
  return [(TUConversationParticipant *)self initWithIdentifier:a3 handle:a4 senderCorrelationIdentifier:0];
}

- (TUConversationParticipant)initWithConversationParticipant:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversationParticipant;
  v5 = [(TUConversationParticipant *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_activeIDSDestination, *((id *)v4 + 13));
    v6->_audioEnabled = *((unsigned char *)v4 + 9);
    v6->_audioPriority = *((void *)v4 + 10);
    objc_storeStrong((id *)&v6->_avcIdentifier, *((id *)v4 + 12));
    objc_storeStrong((id *)&v6->_capabilities, *((id *)v4 + 6));
    objc_storeStrong((id *)&v6->_handle, *((id *)v4 + 4));
    v6->_identifier = *((void *)v4 + 3);
    v6->_muted = *((unsigned char *)v4 + 8);
    v6->_screenEnabled = *((unsigned char *)v4 + 11);
    v6->_screenToken = *((void *)v4 + 8);
    v6->_streamToken = *((void *)v4 + 7);
    v6->_captionsToken = *((void *)v4 + 9);
    v6->_videoEnabled = *((unsigned char *)v4 + 10);
    v6->_videoPriority = *((void *)v4 + 11);
    v6->_audioPaused = *((unsigned char *)v4 + 12);
    v6->_localAccountHandle = *((unsigned char *)v4 + 14);
    v6->_audioVideoMode = *((void *)v4 + 5);
    v6->_presentationMode = *((void *)v4 + 15);
    objc_storeStrong((id *)&v6->_association, *((id *)v4 + 14));
    v6->_lightweight = *((unsigned char *)v4 + 13);
    v6->_guestModeEnabled = *((unsigned char *)v4 + 15);
    v6->_spatialPersonaEnabled = *((unsigned char *)v4 + 16);
    v6->_cameraMixedWithScreen = *((unsigned char *)v4 + 17);
    objc_storeStrong((id *)&v6->_senderCorrelationIdentifier, *((id *)v4 + 16));
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_identifier);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  uint64_t v7 = objc_opt_class();
  objc_super v8 = NSStringFromSelector(sel_handle);
  id v9 = [v4 decodeObjectOfClass:v7 forKey:v8];

  id v10 = [(TUConversationParticipant *)self initWithIdentifier:v6 handle:v9];
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    v12 = NSStringFromSelector(sel_activeIDSDestination);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    activeIDSDestination = v10->_activeIDSDestination;
    v10->_activeIDSDestination = (NSString *)v13;

    uint64_t v15 = NSStringFromSelector(sel_isAudioEnabled);
    v10->_audioEnabled = [v4 decodeBoolForKey:v15];

    v16 = NSStringFromSelector(sel_audioPriority);
    v10->_audioPriority = [v4 decodeIntegerForKey:v16];

    uint64_t v17 = objc_opt_class();
    objc_super v18 = NSStringFromSelector(sel_avcIdentifier);
    uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
    avcIdentifier = v10->_avcIdentifier;
    v10->_avcIdentifier = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(sel_capabilities);
    uint64_t v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    capabilities = v10->_capabilities;
    v10->_capabilities = (TUConversationParticipantCapabilities *)v23;

    v25 = NSStringFromSelector(sel_isMuted);
    v10->_muted = [v4 decodeBoolForKey:v25];

    v26 = NSStringFromSelector(sel_isScreenEnabled);
    v10->_screenEnabled = [v4 decodeBoolForKey:v26];

    v27 = NSStringFromSelector(sel_screenToken);
    v10->_screenToken = [v4 decodeIntegerForKey:v27];

    v28 = NSStringFromSelector(sel_streamToken);
    v10->_streamToken = [v4 decodeIntegerForKey:v28];

    v29 = NSStringFromSelector(sel_captionsToken);
    v10->_captionsToken = [v4 decodeIntegerForKey:v29];

    v30 = NSStringFromSelector(sel_isVideoEnabled);
    v10->_videoEnabled = [v4 decodeBoolForKey:v30];

    v31 = NSStringFromSelector(sel_videoPriority);
    v10->_videoPriority = [v4 decodeIntegerForKey:v31];

    v32 = NSStringFromSelector(sel_isAudioPaused);
    v10->_audioPaused = [v4 decodeBoolForKey:v32];

    v33 = NSStringFromSelector(sel_isLocalAccountHandle);
    v10->_localAccountHandle = [v4 decodeBoolForKey:v33];

    v34 = NSStringFromSelector(sel_audioVideoMode);
    v10->_audioVideoMode = [v4 decodeIntegerForKey:v34];

    v35 = NSStringFromSelector(sel_presentationMode);
    v10->_presentationMode = [v4 decodeIntegerForKey:v35];

    uint64_t v36 = objc_opt_class();
    v37 = NSStringFromSelector(sel_association);
    uint64_t v38 = [v4 decodeObjectOfClass:v36 forKey:v37];
    association = v10->_association;
    v10->_association = (TUConversationParticipantAssociation *)v38;

    v40 = NSStringFromSelector(sel_isLightweight);
    v10->_lightweight = [v4 decodeBoolForKey:v40];

    v41 = NSStringFromSelector(sel_isGuestModeEnabled);
    v10->_guestModeEnabled = [v4 decodeBoolForKey:v41];

    v42 = NSStringFromSelector(sel_isSpatialPersonaEnabled);
    v10->_spatialPersonaEnabled = [v4 decodeBoolForKey:v42];

    v43 = NSStringFromSelector(sel_isCameraMixedWithScreen);
    v10->_cameraMixedWithScreen = [v4 decodeBoolForKey:v43];

    uint64_t v44 = objc_opt_class();
    v45 = NSStringFromSelector(sel_senderCorrelationIdentifier);
    uint64_t v46 = [v4 decodeObjectOfClass:v44 forKey:v45];
    senderCorrelationIdentifier = v10->_senderCorrelationIdentifier;
    v10->_senderCorrelationIdentifier = (NSString *)v46;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUConversationParticipant *)self activeIDSDestination];
  uint64_t v6 = NSStringFromSelector(sel_activeIDSDestination);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(TUConversationParticipant *)self isAudioEnabled];
  objc_super v8 = NSStringFromSelector(sel_isAudioEnabled);
  [v4 encodeBool:v7 forKey:v8];

  int64_t v9 = [(TUConversationParticipant *)self audioPriority];
  id v10 = NSStringFromSelector(sel_audioPriority);
  [v4 encodeInteger:v9 forKey:v10];

  uint64_t v11 = [(TUConversationParticipant *)self avcIdentifier];
  v12 = NSStringFromSelector(sel_avcIdentifier);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(TUConversationParticipant *)self capabilities];
  v14 = NSStringFromSelector(sel_capabilities);
  [v4 encodeObject:v13 forKey:v14];

  uint64_t v15 = [(TUConversationParticipant *)self handle];
  v16 = NSStringFromSelector(sel_handle);
  [v4 encodeObject:v15 forKey:v16];

  unint64_t v17 = [(TUConversationParticipant *)self identifier];
  objc_super v18 = NSStringFromSelector(sel_identifier);
  [v4 encodeInteger:v17 forKey:v18];

  BOOL v19 = [(TUConversationParticipant *)self isMuted];
  v20 = NSStringFromSelector(sel_isMuted);
  [v4 encodeBool:v19 forKey:v20];

  BOOL v21 = [(TUConversationParticipant *)self isScreenEnabled];
  v22 = NSStringFromSelector(sel_isScreenEnabled);
  [v4 encodeBool:v21 forKey:v22];

  int64_t v23 = [(TUConversationParticipant *)self screenToken];
  v24 = NSStringFromSelector(sel_screenToken);
  [v4 encodeInteger:v23 forKey:v24];

  int64_t v25 = [(TUConversationParticipant *)self streamToken];
  v26 = NSStringFromSelector(sel_streamToken);
  [v4 encodeInteger:v25 forKey:v26];

  int64_t v27 = [(TUConversationParticipant *)self captionsToken];
  v28 = NSStringFromSelector(sel_captionsToken);
  [v4 encodeInteger:v27 forKey:v28];

  BOOL v29 = [(TUConversationParticipant *)self isVideoEnabled];
  v30 = NSStringFromSelector(sel_isVideoEnabled);
  [v4 encodeBool:v29 forKey:v30];

  int64_t v31 = [(TUConversationParticipant *)self videoPriority];
  v32 = NSStringFromSelector(sel_videoPriority);
  [v4 encodeInteger:v31 forKey:v32];

  BOOL v33 = [(TUConversationParticipant *)self isAudioPaused];
  v34 = NSStringFromSelector(sel_isAudioPaused);
  [v4 encodeBool:v33 forKey:v34];

  BOOL v35 = [(TUConversationParticipant *)self isLocalAccountHandle];
  uint64_t v36 = NSStringFromSelector(sel_isLocalAccountHandle);
  [v4 encodeBool:v35 forKey:v36];

  unint64_t v37 = [(TUConversationParticipant *)self audioVideoMode];
  uint64_t v38 = NSStringFromSelector(sel_audioVideoMode);
  [v4 encodeInteger:v37 forKey:v38];

  unint64_t v39 = [(TUConversationParticipant *)self presentationMode];
  v40 = NSStringFromSelector(sel_presentationMode);
  [v4 encodeInteger:v39 forKey:v40];

  v41 = [(TUConversationParticipant *)self association];
  v42 = NSStringFromSelector(sel_association);
  [v4 encodeObject:v41 forKey:v42];

  BOOL v43 = [(TUConversationParticipant *)self isLightweight];
  uint64_t v44 = NSStringFromSelector(sel_isLightweight);
  [v4 encodeBool:v43 forKey:v44];

  BOOL v45 = [(TUConversationParticipant *)self isGuestModeEnabled];
  uint64_t v46 = NSStringFromSelector(sel_isGuestModeEnabled);
  [v4 encodeBool:v45 forKey:v46];

  BOOL v47 = [(TUConversationParticipant *)self isSpatialPersonaEnabled];
  v48 = NSStringFromSelector(sel_isSpatialPersonaEnabled);
  [v4 encodeBool:v47 forKey:v48];

  BOOL v49 = [(TUConversationParticipant *)self isCameraMixedWithScreen];
  v50 = NSStringFromSelector(sel_isCameraMixedWithScreen);
  [v4 encodeBool:v49 forKey:v50];

  id v52 = [(TUConversationParticipant *)self senderCorrelationIdentifier];
  v51 = NSStringFromSelector(sel_senderCorrelationIdentifier);
  [v4 encodeObject:v52 forKey:v51];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUConversationParticipant allocWithZone:a3];

  return [(TUConversationParticipant *)v4 initWithConversationParticipant:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[TUMutableConversationParticipant allocWithZone:a3];

  return [(TUConversationParticipant *)v4 initWithConversationParticipant:self];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" identifier=%lu", -[TUConversationParticipant identifier](self, "identifier"));
  id v4 = [(TUConversationParticipant *)self handle];
  [v3 appendFormat:@" handle=%@", v4];

  objc_msgSend(v3, "appendFormat:", @" muted=%d", -[TUConversationParticipant isMuted](self, "isMuted"));
  objc_msgSend(v3, "appendFormat:", @" audioEnabled=%d", -[TUConversationParticipant isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend(v3, "appendFormat:", @" videoEnabled=%d", -[TUConversationParticipant isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v3, "appendFormat:", @" screenEnabled=%d", -[TUConversationParticipant isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend(v3, "appendFormat:", @" streamToken=%ld", -[TUConversationParticipant streamToken](self, "streamToken"));
  objc_msgSend(v3, "appendFormat:", @" screenToken=%ld", -[TUConversationParticipant screenToken](self, "screenToken"));
  objc_msgSend(v3, "appendFormat:", @" captionsToken=%ld", -[TUConversationParticipant captionsToken](self, "captionsToken"));
  v5 = [(TUConversationParticipant *)self capabilities];
  [v3 appendFormat:@" capabilities=%@", v5];

  objc_msgSend(v3, "appendFormat:", @" audioPaused=%d", -[TUConversationParticipant isAudioPaused](self, "isAudioPaused"));
  objc_msgSend(v3, "appendFormat:", @" isLightweight=%d", -[TUConversationParticipant isLightweight](self, "isLightweight"));
  objc_msgSend(v3, "appendFormat:", @" isLocalAccountHandle=%d", -[TUConversationParticipant isLocalAccountHandle](self, "isLocalAccountHandle"));
  uint64_t v6 = [(TUConversationParticipant *)self association];

  if (v6)
  {
    BOOL v7 = [(TUConversationParticipant *)self association];
    [v3 appendFormat:@" association=%@", v7];
  }
  objc_msgSend(v3, "appendFormat:", @" isGuestModeEnabled=%d", -[TUConversationParticipant isGuestModeEnabled](self, "isGuestModeEnabled"));
  objc_msgSend(v3, "appendFormat:", @" avMode=%ld", -[TUConversationParticipant audioVideoMode](self, "audioVideoMode"));
  objc_msgSend(v3, "appendFormat:", @" presentationMode=%ld", -[TUConversationParticipant presentationMode](self, "presentationMode"));
  objc_super v8 = [(TUConversationParticipant *)self senderCorrelationIdentifier];

  if (v8)
  {
    int64_t v9 = [(TUConversationParticipant *)self senderCorrelationIdentifier];
    [v3 appendFormat:@" senderCorrelationIdentifier=%@", v9];
  }
  objc_msgSend(v3, "appendFormat:", @" audioPriority=%ld", -[TUConversationParticipant audioPriority](self, "audioPriority"));
  if ([(TUConversationParticipant *)self isSpatialPersonaEnabled]) {
    objc_msgSend(v3, "appendFormat:", @" isSpatialPersonaEnabled=%d", -[TUConversationParticipant isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  }
  if ([(TUConversationParticipant *)self isCameraMixedWithScreen]) {
    objc_msgSend(v3, "appendFormat:", @" isCameraMixedWithScreen=%d", -[TUConversationParticipant isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  }
  [v3 appendString:@">"];
  id v10 = (void *)[v3 copy];

  return v10;
}

- (unint64_t)hash
{
  v3 = [(TUConversationParticipant *)self activeIDSDestination];
  uint64_t v4 = [v3 hash];
  if ([(TUConversationParticipant *)self isAudioEnabled]) {
    uint64_t v5 = 1231;
  }
  else {
    uint64_t v5 = 1237;
  }
  uint64_t v6 = [(TUConversationParticipant *)self avcIdentifier];
  uint64_t v7 = v5 ^ v4 ^ [v6 hash];
  objc_super v8 = [(TUConversationParticipant *)self capabilities];
  uint64_t v9 = [v8 hash];
  id v10 = [(TUConversationParticipant *)self handle];
  uint64_t v11 = v9 ^ [v10 hash];
  unint64_t v12 = v7 ^ v11 ^ [(TUConversationParticipant *)self identifier];
  if ([(TUConversationParticipant *)self isMuted]) {
    uint64_t v13 = 1231;
  }
  else {
    uint64_t v13 = 1237;
  }
  if ([(TUConversationParticipant *)self isScreenEnabled]) {
    uint64_t v14 = 1231;
  }
  else {
    uint64_t v14 = 1237;
  }
  int64_t v15 = v12 ^ v13 ^ v14 ^ [(TUConversationParticipant *)self screenToken];
  int64_t v16 = [(TUConversationParticipant *)self streamToken];
  int64_t v17 = v16 ^ [(TUConversationParticipant *)self captionsToken];
  if ([(TUConversationParticipant *)self isVideoEnabled]) {
    uint64_t v18 = 1231;
  }
  else {
    uint64_t v18 = 1237;
  }
  int64_t v19 = v17 ^ v18;
  if ([(TUConversationParticipant *)self isAudioPaused]) {
    uint64_t v20 = 1231;
  }
  else {
    uint64_t v20 = 1237;
  }
  uint64_t v21 = v19 ^ v20;
  if ([(TUConversationParticipant *)self isLocalAccountHandle]) {
    uint64_t v22 = 1231;
  }
  else {
    uint64_t v22 = 1237;
  }
  int64_t v23 = v15 ^ v21 ^ v22;
  if ([(TUConversationParticipant *)self isLightweight]) {
    uint64_t v24 = 1231;
  }
  else {
    uint64_t v24 = 1237;
  }
  int64_t v25 = [(TUConversationParticipant *)self association];
  uint64_t v26 = v24 ^ [v25 hash];
  if ([(TUConversationParticipant *)self isGuestModeEnabled]) {
    uint64_t v27 = 1231;
  }
  else {
    uint64_t v27 = 1237;
  }
  unint64_t v28 = v26 ^ v27 ^ [(TUConversationParticipant *)self audioVideoMode];
  unint64_t v29 = v23 ^ v28 ^ [(TUConversationParticipant *)self presentationMode];
  if ([(TUConversationParticipant *)self isSpatialPersonaEnabled]) {
    uint64_t v30 = 1231;
  }
  else {
    uint64_t v30 = 1237;
  }
  if ([(TUConversationParticipant *)self isCameraMixedWithScreen]) {
    uint64_t v31 = 1231;
  }
  else {
    uint64_t v31 = 1237;
  }
  unint64_t v32 = v29 ^ v30 ^ v31;

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUConversationParticipant *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationParticipant *)self isEqualToParticipant:v4];
  }

  return v5;
}

- (BOOL)isEqualToParticipant:(id)a3
{
  id v7 = a3;
  objc_super v8 = [(TUConversationParticipant *)self activeIDSDestination];
  uint64_t v9 = [v7 activeIDSDestination];
  if (v8 != v9)
  {
    v3 = [(TUConversationParticipant *)self activeIDSDestination];
    uint64_t v4 = [v7 activeIDSDestination];
    if (![v3 isEqualToString:v4])
    {
      LOBYTE(v10) = 0;
LABEL_32:

      goto LABEL_33;
    }
  }
  int v11 = [(TUConversationParticipant *)self isAudioEnabled];
  if (v11 != [v7 isAudioEnabled])
  {
    LOBYTE(v10) = 0;
    goto LABEL_31;
  }
  unint64_t v12 = [(TUConversationParticipant *)self avcIdentifier];
  uint64_t v13 = [v7 avcIdentifier];
  if (v12 == v13)
  {
    BOOL v43 = v12;
  }
  else
  {
    BOOL v5 = [(TUConversationParticipant *)self avcIdentifier];
    uint64_t v14 = [v7 avcIdentifier];
    if (![v5 isEqualToString:v14])
    {
      LOBYTE(v10) = 0;
LABEL_29:

      goto LABEL_30;
    }
    v42 = v14;
    BOOL v43 = v12;
  }
  int64_t v15 = [(TUConversationParticipant *)self capabilities];
  int64_t v16 = [v7 capabilities];
  if (![v15 isEqualToCapabilities:v16])
  {

    LOBYTE(v10) = 0;
    goto LABEL_28;
  }
  v40 = v15;
  v41 = v13;
  unint64_t v39 = v16;
  int64_t v17 = [(TUConversationParticipant *)self handle];
  [v7 handle];
  v19 = uint64_t v18 = v17;
  if (!objc_msgSend(v17, "isEqualToHandle:"))
  {
    LOBYTE(v10) = 0;
LABEL_26:
    uint64_t v13 = v41;
    goto LABEL_27;
  }
  uint64_t v38 = v5;
  unint64_t v20 = [(TUConversationParticipant *)self identifier];
  uint64_t v13 = v41;
  if (v20 == [v7 identifier])
  {
    int v21 = [(TUConversationParticipant *)self isMuted];
    if (v21 == [v7 isMuted])
    {
      int v22 = [(TUConversationParticipant *)self isScreenEnabled];
      if (v22 == [v7 isScreenEnabled])
      {
        int64_t v23 = [(TUConversationParticipant *)self screenToken];
        if (v23 == [v7 screenToken])
        {
          int64_t v24 = [(TUConversationParticipant *)self streamToken];
          if (v24 == [v7 streamToken])
          {
            int64_t v25 = [(TUConversationParticipant *)self captionsToken];
            if (v25 == [v7 captionsToken])
            {
              int v26 = [(TUConversationParticipant *)self isVideoEnabled];
              if (v26 == [v7 isVideoEnabled])
              {
                int v27 = [(TUConversationParticipant *)self isAudioPaused];
                if (v27 == [v7 isAudioPaused])
                {
                  int v28 = [(TUConversationParticipant *)self isLocalAccountHandle];
                  if (v28 == [v7 isLocalAccountHandle])
                  {
                    int v29 = [(TUConversationParticipant *)self isLightweight];
                    if (v29 == [v7 isLightweight])
                    {
                      uint64_t v31 = [(TUConversationParticipant *)self association];
                      unint64_t v37 = [v7 association];
                      if (TUObjectsAreEqualOrNil((unint64_t)v31, (uint64_t)v37)
                        && (int v32 = [(TUConversationParticipant *)self isGuestModeEnabled],
                            v32 == [v7 isGuestModeEnabled])
                        && (unint64_t v33 = [(TUConversationParticipant *)self audioVideoMode],
                            v33 == [v7 audioVideoMode])
                        && (unint64_t v34 = [(TUConversationParticipant *)self presentationMode],
                            v34 == [v7 presentationMode])
                        && (int v35 = [(TUConversationParticipant *)self isSpatialPersonaEnabled],
                            v35 == [v7 isSpatialPersonaEnabled]))
                      {
                        BOOL v36 = [(TUConversationParticipant *)self isCameraMixedWithScreen];
                        int v10 = v36 ^ [v7 isCameraMixedWithScreen] ^ 1;
                      }
                      else
                      {
                        LOBYTE(v10) = 0;
                      }

                      BOOL v5 = v38;
                      goto LABEL_26;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  LOBYTE(v10) = 0;
  BOOL v5 = v38;
LABEL_27:

LABEL_28:
  uint64_t v14 = v42;
  unint64_t v12 = v43;
  if (v43 != v13) {
    goto LABEL_29;
  }
LABEL_30:

LABEL_31:
  if (v8 != v9) {
    goto LABEL_32;
  }
LABEL_33:

  return v10;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (unint64_t)audioVideoMode
{
  return self->_audioVideoMode;
}

- (void)setAudioVideoMode:(unint64_t)a3
{
  self->_audioVideoMode = a3;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
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

- (BOOL)isAudioPaused
{
  return self->_audioPaused;
}

- (void)setAudioPaused:(BOOL)a3
{
  self->_audioPaused = a3;
}

- (BOOL)isLightweight
{
  return self->_lightweight;
}

- (void)setLightweight:(BOOL)a3
{
  self->_lightweight = a3;
}

- (TUConversationParticipantCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
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

- (BOOL)isLocalAccountHandle
{
  return self->_localAccountHandle;
}

- (void)setLocalAccountHandle:(BOOL)a3
{
  self->_localAccountHandle = a3;
}

- (TUConversationParticipantAssociation)association
{
  return self->_association;
}

- (void)setAssociation:(id)a3
{
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
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

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  self->_spatialPersonaEnabled = a3;
}

- (BOOL)isCameraMixedWithScreen
{
  return self->_cameraMixedWithScreen;
}

- (void)setCameraMixedWithScreen:(BOOL)a3
{
  self->_cameraMixedWithScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_association, 0);
  objc_storeStrong((id *)&self->_activeIDSDestination, 0);
  objc_storeStrong((id *)&self->_avcIdentifier, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end