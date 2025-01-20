@interface TUConversationParticipantCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCapabilities:(id)a3;
- (BOOL)isGFTDowngradeToOneToOneAvailable;
- (BOOL)isGondolaCallingAvailable;
- (BOOL)isMomentsAvailable;
- (BOOL)isPersonaAvailable;
- (BOOL)isPhotosSharePlayAvailable;
- (BOOL)isScreenSharingAvailable;
- (BOOL)isUPlusNDowngradeAvailable;
- (BOOL)isUPlusOneAVLessAvailable;
- (BOOL)isUPlusOneScreenShareAvailable;
- (BOOL)isUPlusOneVisionToVisionAvailable;
- (BOOL)supportsLeaveContext;
- (BOOL)supportsRequestToScreenShare;
- (TUConversationParticipantCapabilities)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)sharePlayProtocolVersion;
- (unint64_t)visionCallEstablishmentVersion;
- (unint64_t)visionFeatureVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setGftDowngradeToOneToOneAvailable:(BOOL)a3;
- (void)setGondolaCallingAvailable:(BOOL)a3;
- (void)setMomentsAvailable:(BOOL)a3;
- (void)setPersonaAvailable:(BOOL)a3;
- (void)setPhotosSharePlayAvailable:(BOOL)a3;
- (void)setScreenSharingAvailable:(BOOL)a3;
- (void)setSharePlayProtocolVersion:(unint64_t)a3;
- (void)setSupportsLeaveContext:(BOOL)a3;
- (void)setSupportsRequestToScreenShare:(BOOL)a3;
- (void)setUPlusNDowngradeAvailable:(BOOL)a3;
- (void)setUPlusOneAVLessAvailable:(BOOL)a3;
- (void)setUPlusOneScreenShareAvailable:(BOOL)a3;
- (void)setUPlusOneVisionToVisionAvailable:(BOOL)a3;
- (void)setVisionCallEstablishmentVersion:(unint64_t)a3;
- (void)setVisionFeatureVersion:(unint64_t)a3;
@end

@implementation TUConversationParticipantCapabilities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" momentsAvailable=%d", -[TUConversationParticipantCapabilities isMomentsAvailable](self, "isMomentsAvailable"));
  objc_msgSend(v3, "appendFormat:", @" screenSharingAvailable=%d", -[TUConversationParticipantCapabilities isScreenSharingAvailable](self, "isScreenSharingAvailable"));
  objc_msgSend(v3, "appendFormat:", @" gondolaCallingAvailable=%d", -[TUConversationParticipantCapabilities isGondolaCallingAvailable](self, "isGondolaCallingAvailable"));
  objc_msgSend(v3, "appendFormat:", @" personaAvailable=%d", -[TUConversationParticipantCapabilities isPersonaAvailable](self, "isPersonaAvailable"));
  objc_msgSend(v3, "appendFormat:", @" gftDowngradeToOneToOneAvailable=%d", -[TUConversationParticipantCapabilities isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable"));
  objc_msgSend(v3, "appendFormat:", @" uPlusNDowngradeAvailable=%d", -[TUConversationParticipantCapabilities isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable"));
  objc_msgSend(v3, "appendFormat:", @" uPlusScreenShareAvailable=%d", -[TUConversationParticipantCapabilities isUPlusOneScreenShareAvailable](self, "isUPlusOneScreenShareAvailable"));
  objc_msgSend(v3, "appendFormat:", @" uPlusOneAVLessAvailable=%d", -[TUConversationParticipantCapabilities isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable"));
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TUConversationParticipantCapabilities sharePlayProtocolVersion](self, "sharePlayProtocolVersion"));
  [v3 appendFormat:@" sharePlayProtocolVersion=%@", v4];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[TUConversationParticipantCapabilities supportsLeaveContext](self, "supportsLeaveContext"));
  [v3 appendFormat:@" supportsLeaveContext=%@", v5];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[TUConversationParticipantCapabilities supportsRequestToScreenShare](self, "supportsRequestToScreenShare"));
  [v3 appendFormat:@" supportsRequestToScreenShare=%@", v6];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TUConversationParticipantCapabilities visionFeatureVersion](self, "visionFeatureVersion"));
  [v3 appendFormat:@" visionFeatureVersion=%@", v7];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TUConversationParticipantCapabilities visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion"));
  [v3 appendFormat:@" visionCallEstablishmentVersion=%@", v8];

  objc_msgSend(v3, "appendFormat:", @" uPlusOneVisionToVisionAvailable=%d", -[TUConversationParticipantCapabilities isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable"));
  objc_msgSend(v3, "appendFormat:", @" photosSharePlayAvailable=%d", -[TUConversationParticipantCapabilities isPhotosSharePlayAvailable](self, "isPhotosSharePlayAvailable"));
  [v3 appendString:@">"];
  v9 = (void *)[v3 copy];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationParticipantCapabilities *)self isEqualToCapabilities:v4];

  return v5;
}

- (BOOL)isEqualToCapabilities:(id)a3
{
  id v4 = a3;
  int v5 = [(TUConversationParticipantCapabilities *)self isMomentsAvailable];
  if (v5 != [v4 isMomentsAvailable]) {
    goto LABEL_14;
  }
  int v6 = [(TUConversationParticipantCapabilities *)self isScreenSharingAvailable];
  if (v6 != [v4 isScreenSharingAvailable]) {
    goto LABEL_14;
  }
  int v7 = [(TUConversationParticipantCapabilities *)self isGondolaCallingAvailable];
  if (v7 != [v4 isGondolaCallingAvailable]) {
    goto LABEL_14;
  }
  int v8 = [(TUConversationParticipantCapabilities *)self isPersonaAvailable];
  if (v8 != [v4 isPersonaAvailable]) {
    goto LABEL_14;
  }
  int v9 = [(TUConversationParticipantCapabilities *)self isGFTDowngradeToOneToOneAvailable];
  if (v9 != [v4 isGFTDowngradeToOneToOneAvailable]) {
    goto LABEL_14;
  }
  int v10 = [(TUConversationParticipantCapabilities *)self isUPlusNDowngradeAvailable];
  if (v10 != [v4 isUPlusNDowngradeAvailable]) {
    goto LABEL_14;
  }
  unint64_t v11 = [(TUConversationParticipantCapabilities *)self sharePlayProtocolVersion];
  if (v11 == [v4 sharePlayProtocolVersion]
    && (int v12 = [(TUConversationParticipantCapabilities *)self supportsLeaveContext],
        v12 == [v4 supportsLeaveContext])
    && (int v13 = [(TUConversationParticipantCapabilities *)self isUPlusOneAVLessAvailable],
        v13 == [v4 isUPlusOneAVLessAvailable])
    && (unint64_t v14 = [(TUConversationParticipantCapabilities *)self visionFeatureVersion],
        v14 == [v4 visionFeatureVersion])
    && (unint64_t v15 = -[TUConversationParticipantCapabilities visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion"), v15 == [v4 visionCallEstablishmentVersion])&& (v16 = -[TUConversationParticipantCapabilities isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable"), v16 == objc_msgSend(v4, "isUPlusOneVisionToVisionAvailable"))&& (v17 = -[TUConversationParticipantCapabilities supportsRequestToScreenShare](self, "supportsRequestToScreenShare"), v17 == objc_msgSend(v4, "supportsRequestToScreenShare")))
  {
    BOOL v20 = [(TUConversationParticipantCapabilities *)self isPhotosSharePlayAvailable];
    int v18 = v20 ^ [v4 isPhotosSharePlayAvailable] ^ 1;
  }
  else
  {
LABEL_14:
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  if ([(TUConversationParticipantCapabilities *)self isMomentsAvailable]) {
    uint64_t v3 = 1231;
  }
  else {
    uint64_t v3 = 1237;
  }
  if ([(TUConversationParticipantCapabilities *)self isScreenSharingAvailable]) {
    uint64_t v4 = 1231;
  }
  else {
    uint64_t v4 = 1237;
  }
  uint64_t v5 = v4 ^ v3;
  if ([(TUConversationParticipantCapabilities *)self isGondolaCallingAvailable]) {
    uint64_t v6 = 1231;
  }
  else {
    uint64_t v6 = 1237;
  }
  if ([(TUConversationParticipantCapabilities *)self isPersonaAvailable]) {
    uint64_t v7 = 1231;
  }
  else {
    uint64_t v7 = 1237;
  }
  uint64_t v8 = v5 ^ v6 ^ v7;
  if ([(TUConversationParticipantCapabilities *)self isGFTDowngradeToOneToOneAvailable])
  {
    uint64_t v9 = 1231;
  }
  else
  {
    uint64_t v9 = 1237;
  }
  if ([(TUConversationParticipantCapabilities *)self isUPlusNDowngradeAvailable]) {
    uint64_t v10 = 1231;
  }
  else {
    uint64_t v10 = 1237;
  }
  uint64_t v11 = v9 ^ v10;
  if ([(TUConversationParticipantCapabilities *)self isUPlusOneAVLessAvailable]) {
    uint64_t v12 = 1231;
  }
  else {
    uint64_t v12 = 1237;
  }
  uint64_t v13 = v8 ^ v11 ^ v12;
  unint64_t v14 = [(TUConversationParticipantCapabilities *)self sharePlayProtocolVersion];
  unint64_t v15 = v14 ^ [(TUConversationParticipantCapabilities *)self visionFeatureVersion];
  unint64_t v16 = v15 ^ [(TUConversationParticipantCapabilities *)self visionCallEstablishmentVersion];
  if ([(TUConversationParticipantCapabilities *)self isUPlusOneVisionToVisionAvailable])
  {
    uint64_t v17 = 1231;
  }
  else
  {
    uint64_t v17 = 1237;
  }
  unint64_t v18 = v16 ^ v17;
  if ([(TUConversationParticipantCapabilities *)self supportsLeaveContext]) {
    uint64_t v19 = 1231;
  }
  else {
    uint64_t v19 = 1237;
  }
  uint64_t v20 = v18 ^ v19;
  if ([(TUConversationParticipantCapabilities *)self supportsRequestToScreenShare]) {
    uint64_t v21 = 1231;
  }
  else {
    uint64_t v21 = 1237;
  }
  uint64_t v22 = v13 ^ v20 ^ v21;
  if ([(TUConversationParticipantCapabilities *)self isPhotosSharePlayAvailable]) {
    uint64_t v23 = 1231;
  }
  else {
    uint64_t v23 = 1237;
  }
  return v22 ^ v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  objc_msgSend(v4, "setScreenSharingAvailable:", -[TUConversationParticipantCapabilities isScreenSharingAvailable](self, "isScreenSharingAvailable"));
  objc_msgSend(v4, "setMomentsAvailable:", -[TUConversationParticipantCapabilities isMomentsAvailable](self, "isMomentsAvailable"));
  objc_msgSend(v4, "setGondolaCallingAvailable:", -[TUConversationParticipantCapabilities isGondolaCallingAvailable](self, "isGondolaCallingAvailable"));
  objc_msgSend(v4, "setPersonaAvailable:", -[TUConversationParticipantCapabilities isPersonaAvailable](self, "isPersonaAvailable"));
  objc_msgSend(v4, "setGftDowngradeToOneToOneAvailable:", -[TUConversationParticipantCapabilities isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable"));
  objc_msgSend(v4, "setUPlusOneScreenShareAvailable:", -[TUConversationParticipantCapabilities isUPlusOneScreenShareAvailable](self, "isUPlusOneScreenShareAvailable"));
  objc_msgSend(v4, "setUPlusOneAVLessAvailable:", -[TUConversationParticipantCapabilities isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable"));
  objc_msgSend(v4, "setUPlusNDowngradeAvailable:", -[TUConversationParticipantCapabilities isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable"));
  objc_msgSend(v4, "setSharePlayProtocolVersion:", -[TUConversationParticipantCapabilities sharePlayProtocolVersion](self, "sharePlayProtocolVersion"));
  objc_msgSend(v4, "setVisionFeatureVersion:", -[TUConversationParticipantCapabilities visionFeatureVersion](self, "visionFeatureVersion"));
  objc_msgSend(v4, "setVisionCallEstablishmentVersion:", -[TUConversationParticipantCapabilities visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion"));
  objc_msgSend(v4, "setUPlusOneVisionToVisionAvailable:", -[TUConversationParticipantCapabilities isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable"));
  objc_msgSend(v4, "setSupportsLeaveContext:", -[TUConversationParticipantCapabilities supportsLeaveContext](self, "supportsLeaveContext"));
  objc_msgSend(v4, "setSupportsRequestToScreenShare:", -[TUConversationParticipantCapabilities supportsRequestToScreenShare](self, "supportsRequestToScreenShare"));
  objc_msgSend(v4, "setPhotosSharePlayAvailable:", -[TUConversationParticipantCapabilities isPhotosSharePlayAvailable](self, "isPhotosSharePlayAvailable"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationParticipantCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationParticipantCapabilities *)self init];
  if (v5)
  {
    uint64_t v6 = NSStringFromSelector(sel_isMomentsAvailable);
    v5->_momentsAvailable = [v4 decodeBoolForKey:v6];

    uint64_t v7 = NSStringFromSelector(sel_isScreenSharingAvailable);
    v5->_screenSharingAvailable = [v4 decodeBoolForKey:v7];

    uint64_t v8 = NSStringFromSelector(sel_isGondolaCallingAvailable);
    v5->_gondolaCallingAvailable = [v4 decodeBoolForKey:v8];

    uint64_t v9 = NSStringFromSelector(sel_isPersonaAvailable);
    v5->_personaAvailable = [v4 decodeBoolForKey:v9];

    uint64_t v10 = NSStringFromSelector(sel_isGFTDowngradeToOneToOneAvailable);
    v5->_gftDowngradeToOneToOneAvailable = [v4 decodeBoolForKey:v10];

    uint64_t v11 = NSStringFromSelector(sel_isUPlusNDowngradeAvailable);
    v5->_uPlusNDowngradeAvailable = [v4 decodeBoolForKey:v11];

    uint64_t v12 = NSStringFromSelector(sel_sharePlayProtocolVersion);
    v5->_sharePlayProtocolVersion = [v4 decodeIntegerForKey:v12];

    uint64_t v13 = NSStringFromSelector(sel_visionFeatureVersion);
    v5->_visionFeatureVersion = [v4 decodeIntegerForKey:v13];

    unint64_t v14 = NSStringFromSelector(sel_visionCallEstablishmentVersion);
    v5->_visionCallEstablishmentVersion = [v4 decodeIntegerForKey:v14];

    unint64_t v15 = NSStringFromSelector(sel_isUPlusOneScreenShareAvailable);
    v5->_uPlusOneScreenShareAvailable = [v4 decodeBoolForKey:v15];

    unint64_t v16 = NSStringFromSelector(sel_isUPlusOneAVLessAvailable);
    v5->_uPlusOneAVLessAvailable = [v4 decodeBoolForKey:v16];

    uint64_t v17 = NSStringFromSelector(sel_isUPlusOneVisionToVisionAvailable);
    v5->_uPlusOneVisionToVisionAvailable = [v4 decodeBoolForKey:v17];

    unint64_t v18 = NSStringFromSelector(sel_supportsLeaveContext);
    v5->_supportsLeaveContext = [v4 decodeBoolForKey:v18];

    uint64_t v19 = NSStringFromSelector(sel_supportsRequestToScreenShare);
    v5->_supportsRequestToScreenShare = [v4 decodeBoolForKey:v19];

    uint64_t v20 = NSStringFromSelector(sel_isPhotosSharePlayAvailable);
    v5->_photosSharePlayAvailable = [v4 decodeBoolForKey:v20];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationParticipantCapabilities *)self isMomentsAvailable];
  uint64_t v6 = NSStringFromSelector(sel_isMomentsAvailable);
  [v4 encodeBool:v5 forKey:v6];

  BOOL v7 = [(TUConversationParticipantCapabilities *)self isScreenSharingAvailable];
  uint64_t v8 = NSStringFromSelector(sel_isScreenSharingAvailable);
  [v4 encodeBool:v7 forKey:v8];

  BOOL v9 = [(TUConversationParticipantCapabilities *)self isGondolaCallingAvailable];
  uint64_t v10 = NSStringFromSelector(sel_isGondolaCallingAvailable);
  [v4 encodeBool:v9 forKey:v10];

  BOOL v11 = [(TUConversationParticipantCapabilities *)self isPersonaAvailable];
  uint64_t v12 = NSStringFromSelector(sel_isPersonaAvailable);
  [v4 encodeBool:v11 forKey:v12];

  BOOL v13 = [(TUConversationParticipantCapabilities *)self isGFTDowngradeToOneToOneAvailable];
  unint64_t v14 = NSStringFromSelector(sel_isGFTDowngradeToOneToOneAvailable);
  [v4 encodeBool:v13 forKey:v14];

  BOOL v15 = [(TUConversationParticipantCapabilities *)self isUPlusOneScreenShareAvailable];
  unint64_t v16 = NSStringFromSelector(sel_isUPlusOneScreenShareAvailable);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(TUConversationParticipantCapabilities *)self isUPlusOneAVLessAvailable];
  unint64_t v18 = NSStringFromSelector(sel_isUPlusOneAVLessAvailable);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(TUConversationParticipantCapabilities *)self isUPlusNDowngradeAvailable];
  uint64_t v20 = NSStringFromSelector(sel_isUPlusNDowngradeAvailable);
  [v4 encodeBool:v19 forKey:v20];

  unint64_t v21 = [(TUConversationParticipantCapabilities *)self sharePlayProtocolVersion];
  uint64_t v22 = NSStringFromSelector(sel_sharePlayProtocolVersion);
  [v4 encodeInteger:v21 forKey:v22];

  unint64_t v23 = [(TUConversationParticipantCapabilities *)self visionFeatureVersion];
  v24 = NSStringFromSelector(sel_visionFeatureVersion);
  [v4 encodeInteger:v23 forKey:v24];

  unint64_t v25 = [(TUConversationParticipantCapabilities *)self visionCallEstablishmentVersion];
  v26 = NSStringFromSelector(sel_visionCallEstablishmentVersion);
  [v4 encodeInteger:v25 forKey:v26];

  BOOL v27 = [(TUConversationParticipantCapabilities *)self isUPlusOneVisionToVisionAvailable];
  v28 = NSStringFromSelector(sel_isUPlusOneVisionToVisionAvailable);
  [v4 encodeBool:v27 forKey:v28];

  BOOL v29 = [(TUConversationParticipantCapabilities *)self supportsLeaveContext];
  v30 = NSStringFromSelector(sel_supportsLeaveContext);
  [v4 encodeBool:v29 forKey:v30];

  BOOL v31 = [(TUConversationParticipantCapabilities *)self supportsRequestToScreenShare];
  v32 = NSStringFromSelector(sel_supportsRequestToScreenShare);
  [v4 encodeBool:v31 forKey:v32];

  BOOL v33 = [(TUConversationParticipantCapabilities *)self isPhotosSharePlayAvailable];
  NSStringFromSelector(sel_isPhotosSharePlayAvailable);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v33 forKey:v34];
}

- (BOOL)isMomentsAvailable
{
  return self->_momentsAvailable;
}

- (void)setMomentsAvailable:(BOOL)a3
{
  self->_momentsAvailable = a3;
}

- (BOOL)isScreenSharingAvailable
{
  return self->_screenSharingAvailable;
}

- (void)setScreenSharingAvailable:(BOOL)a3
{
  self->_screenSharingAvailable = a3;
}

- (BOOL)isGondolaCallingAvailable
{
  return self->_gondolaCallingAvailable;
}

- (void)setGondolaCallingAvailable:(BOOL)a3
{
  self->_gondolaCallingAvailable = a3;
}

- (BOOL)isPersonaAvailable
{
  return self->_personaAvailable;
}

- (void)setPersonaAvailable:(BOOL)a3
{
  self->_personaAvailable = a3;
}

- (BOOL)isGFTDowngradeToOneToOneAvailable
{
  return self->_gftDowngradeToOneToOneAvailable;
}

- (void)setGftDowngradeToOneToOneAvailable:(BOOL)a3
{
  self->_gftDowngradeToOneToOneAvailable = a3;
}

- (BOOL)isUPlusNDowngradeAvailable
{
  return self->_uPlusNDowngradeAvailable;
}

- (void)setUPlusNDowngradeAvailable:(BOOL)a3
{
  self->_uPlusNDowngradeAvailable = a3;
}

- (BOOL)isUPlusOneScreenShareAvailable
{
  return self->_uPlusOneScreenShareAvailable;
}

- (void)setUPlusOneScreenShareAvailable:(BOOL)a3
{
  self->_uPlusOneScreenShareAvailable = a3;
}

- (BOOL)isUPlusOneAVLessAvailable
{
  return self->_uPlusOneAVLessAvailable;
}

- (void)setUPlusOneAVLessAvailable:(BOOL)a3
{
  self->_uPlusOneAVLessAvailable = a3;
}

- (BOOL)supportsLeaveContext
{
  return self->_supportsLeaveContext;
}

- (void)setSupportsLeaveContext:(BOOL)a3
{
  self->_supportsLeaveContext = a3;
}

- (BOOL)supportsRequestToScreenShare
{
  return self->_supportsRequestToScreenShare;
}

- (void)setSupportsRequestToScreenShare:(BOOL)a3
{
  self->_supportsRequestToScreenShare = a3;
}

- (unint64_t)sharePlayProtocolVersion
{
  return self->_sharePlayProtocolVersion;
}

- (void)setSharePlayProtocolVersion:(unint64_t)a3
{
  self->_sharePlayProtocolVersion = a3;
}

- (unint64_t)visionFeatureVersion
{
  return self->_visionFeatureVersion;
}

- (void)setVisionFeatureVersion:(unint64_t)a3
{
  self->_visionFeatureVersion = a3;
}

- (unint64_t)visionCallEstablishmentVersion
{
  return self->_visionCallEstablishmentVersion;
}

- (void)setVisionCallEstablishmentVersion:(unint64_t)a3
{
  self->_visionCallEstablishmentVersion = a3;
}

- (BOOL)isUPlusOneVisionToVisionAvailable
{
  return self->_uPlusOneVisionToVisionAvailable;
}

- (void)setUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  self->_uPlusOneVisionToVisionAvailable = a3;
}

- (BOOL)isPhotosSharePlayAvailable
{
  return self->_photosSharePlayAvailable;
}

- (void)setPhotosSharePlayAvailable:(BOOL)a3
{
  self->_photosSharePlayAvailable = a3;
}

@end