@interface CSDConversationJoinContext
- (BOOL)isGFTDowngradeToOneToOneAvailable;
- (BOOL)isInitiator;
- (BOOL)isInvitation;
- (BOOL)isLightweight;
- (BOOL)isMomentsAvailable;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isPersonaAvailable;
- (BOOL)isScreening;
- (BOOL)isSpatialPersonaEnabled;
- (BOOL)isUPlusNDowngradeAvailable;
- (BOOL)isUPlusOneAVLessAvailable;
- (BOOL)isUPlusOneScreenShareAvailable;
- (BOOL)isUPlusOneVisionToVisionAvailable;
- (BOOL)isUpgrade;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (BOOL)representsTransitionFromPending;
- (BOOL)shouldSuppressInCallUI;
- (BOOL)supportsLeaveContext;
- (BOOL)supportsRequestToScreenShare;
- (BOOL)wantsStagingArea;
- (CSDConversationJoinContext)init;
- (NSSet)invitationPreferences;
- (NSString)collaborationIdentifier;
- (NSString)messagesGroupName;
- (NSUUID)messagesGroupUUID;
- (NSUUID)upgradeSessionUUID;
- (TUConversationActivity)activity;
- (TUConversationParticipantAssociation)participantAssociation;
- (TUConversationProvider)provider;
- (TUScreenSharingRequest)screenSharingRequest;
- (id)description;
- (unint64_t)avMode;
- (unint64_t)presentationMode;
- (unint64_t)sharePlayProtocolVersion;
- (unint64_t)visionCallEstablishmentVersion;
- (unint64_t)visionFeatureVersion;
- (void)setActivity:(id)a3;
- (void)setAvMode:(unint64_t)a3;
- (void)setCollaborationIdentifier:(id)a3;
- (void)setGftDowngradeToOneToOneAvailable:(BOOL)a3;
- (void)setInitiator:(BOOL)a3;
- (void)setInvitation:(BOOL)a3;
- (void)setInvitationPreferences:(id)a3;
- (void)setLightweight:(BOOL)a3;
- (void)setMessagesGroupName:(id)a3;
- (void)setMessagesGroupUUID:(id)a3;
- (void)setMomentsAvailable:(BOOL)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setParticipantAssociation:(id)a3;
- (void)setPersonaAvailable:(BOOL)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setProvider:(id)a3;
- (void)setRepresentsTransitionFromPending:(BOOL)a3;
- (void)setScreenSharingRequest:(id)a3;
- (void)setScreening:(BOOL)a3;
- (void)setSharePlayProtocolVersion:(unint64_t)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setSpatialPersonaEnabled:(BOOL)a3;
- (void)setSupportsLeaveContext:(BOOL)a3;
- (void)setSupportsRequestToScreenShare:(BOOL)a3;
- (void)setUPlusNDowngradeAvailable:(BOOL)a3;
- (void)setUPlusOneAVLessAvailable:(BOOL)a3;
- (void)setUPlusOneScreenShareAvailable:(BOOL)a3;
- (void)setUPlusOneVisionToVisionAvailable:(BOOL)a3;
- (void)setUpgrade:(BOOL)a3;
- (void)setUpgradeSessionUUID:(id)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setVisionCallEstablishmentVersion:(unint64_t)a3;
- (void)setVisionFeatureVersion:(unint64_t)a3;
- (void)setWantsStagingArea:(BOOL)a3;
@end

@implementation CSDConversationJoinContext

- (CSDConversationJoinContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSDConversationJoinContext;
  result = [(CSDConversationJoinContext *)&v3 init];
  if (result) {
    result->_uPlusOneAVLessAvailable = 1;
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  v4 = NSStringFromSelector("isInvitation");
  [v3 appendFormat:@"%@=%d", v4, -[CSDConversationJoinContext isInvitation](self, "isInvitation")];

  [v3 appendFormat:@", "];
  v5 = NSStringFromSelector("isMomentsAvailable");
  [v3 appendFormat:@"%@=%d", v5, -[CSDConversationJoinContext isMomentsAvailable](self, "isMomentsAvailable")];

  [v3 appendFormat:@", "];
  v6 = NSStringFromSelector("isPersonaAvailable");
  [v3 appendFormat:@"%@=%d", v6, -[CSDConversationJoinContext isPersonaAvailable](self, "isPersonaAvailable")];

  [v3 appendFormat:@", "];
  v7 = NSStringFromSelector("isUpgrade");
  [v3 appendFormat:@"%@=%d", v7, -[CSDConversationJoinContext isUpgrade](self, "isUpgrade")];

  [v3 appendFormat:@", "];
  v8 = NSStringFromSelector("isVideo");
  [v3 appendFormat:@"%@=%d", v8, -[CSDConversationJoinContext isVideo](self, "isVideo")];

  [v3 appendFormat:@", "];
  v9 = NSStringFromSelector("isVideoEnabled");
  [v3 appendFormat:@"%@=%d", v9, -[CSDConversationJoinContext isVideoEnabled](self, "isVideoEnabled")];

  [v3 appendFormat:@", "];
  v10 = NSStringFromSelector("shouldSuppressInCallUI");
  [v3 appendFormat:@"%@=%d", v10, -[CSDConversationJoinContext shouldSuppressInCallUI](self, "shouldSuppressInCallUI")];

  [v3 appendFormat:@", "];
  v11 = NSStringFromSelector("wantsStagingArea");
  [v3 appendFormat:@"%@=%d", v11, -[CSDConversationJoinContext wantsStagingArea](self, "wantsStagingArea")];

  [v3 appendFormat:@", "];
  v12 = NSStringFromSelector("upgradeSessionUUID");
  v13 = [(CSDConversationJoinContext *)self upgradeSessionUUID];
  [v3 appendFormat:@"%@=%@", v12, v13];

  [v3 appendFormat:@", "];
  v14 = NSStringFromSelector("isOneToOneModeEnabled");
  [v3 appendFormat:@"%@=%d", v14, -[CSDConversationJoinContext isOneToOneModeEnabled](self, "isOneToOneModeEnabled")];

  [v3 appendFormat:@", "];
  v15 = NSStringFromSelector("provider");
  v16 = [(CSDConversationJoinContext *)self provider];
  [v3 appendFormat:@"%@=%@", v15, v16];

  [v3 appendFormat:@", "];
  v17 = NSStringFromSelector("invitationPreferences");
  v18 = [(CSDConversationJoinContext *)self invitationPreferences];
  [v3 appendFormat:@"%@=%@", v17, v18];

  [v3 appendFormat:@", "];
  v19 = NSStringFromSelector("isLightweight");
  [v3 appendFormat:@"%@=%d", v19, -[CSDConversationJoinContext isLightweight](self, "isLightweight")];

  [v3 appendFormat:@", "];
  v20 = NSStringFromSelector("sharePlayProtocolVersion");
  v21 = +[NSNumber numberWithUnsignedInteger:[(CSDConversationJoinContext *)self sharePlayProtocolVersion]];
  [v3 appendFormat:@"%@=%@", v20, v21];

  [v3 appendFormat:@", "];
  v22 = NSStringFromSelector("visionFeatureVersion");
  v23 = +[NSNumber numberWithUnsignedInteger:[(CSDConversationJoinContext *)self visionFeatureVersion]];
  [v3 appendFormat:@"%@=%@", v22, v23];

  [v3 appendFormat:@", "];
  v24 = NSStringFromSelector("visionCallEstablishmentVersion");
  v25 = +[NSNumber numberWithUnsignedInteger:[(CSDConversationJoinContext *)self visionCallEstablishmentVersion]];
  [v3 appendFormat:@"%@=%@", v24, v25];

  [v3 appendFormat:@", "];
  v26 = NSStringFromSelector("isGFTDowngradeToOneToOneAvailable");
  [v3 appendFormat:@"%@=%d", v26, -[CSDConversationJoinContext isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable")];

  [v3 appendFormat:@", "];
  v27 = NSStringFromSelector("isUPlusNDowngradeAvailable");
  [v3 appendFormat:@"%@=%d", v27, -[CSDConversationJoinContext isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable")];

  [v3 appendFormat:@", "];
  v28 = NSStringFromSelector("supportsLeaveContext");
  [v3 appendFormat:@"%@=%d", v28, -[CSDConversationJoinContext supportsLeaveContext](self, "supportsLeaveContext")];

  [v3 appendFormat:@", "];
  v29 = NSStringFromSelector("supportsRequestToScreenShare");
  [v3 appendFormat:@"%@=%d", v29, -[CSDConversationJoinContext supportsRequestToScreenShare](self, "supportsRequestToScreenShare")];

  [v3 appendFormat:@", "];
  v30 = NSStringFromSelector("isUPlusOneScreenShareAvailable");
  [v3 appendFormat:@"%@=%d", v30, -[CSDConversationJoinContext isUPlusOneScreenShareAvailable](self, "isUPlusOneScreenShareAvailable")];

  [v3 appendFormat:@", "];
  v31 = NSStringFromSelector("isUPlusOneAVLessAvailable");
  [v3 appendFormat:@"%@=%d", v31, -[CSDConversationJoinContext isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable")];

  [v3 appendFormat:@", "];
  v32 = NSStringFromSelector("avMode");
  [v3 appendFormat:@"%@=%lu", v32, -[CSDConversationJoinContext avMode](self, "avMode")];

  [v3 appendFormat:@", "];
  v33 = NSStringFromSelector("presentationMode");
  [v3 appendFormat:@"%@=%lu", v33, -[CSDConversationJoinContext presentationMode](self, "presentationMode")];

  [v3 appendFormat:@", "];
  v34 = NSStringFromSelector("screening");
  [v3 appendFormat:@"%@=%d", v34, -[CSDConversationJoinContext isScreening](self, "isScreening")];

  v35 = [(CSDConversationJoinContext *)self participantAssociation];

  if (v35)
  {
    [v3 appendFormat:@", "];
    v36 = NSStringFromSelector("participantAssociation");
    v37 = [(CSDConversationJoinContext *)self participantAssociation];
    [v3 appendFormat:@"%@=%@", v36, v37];
  }
  v38 = [(CSDConversationJoinContext *)self activity];

  if (v38)
  {
    [v3 appendFormat:@", "];
    v39 = NSStringFromSelector("activity");
    v40 = [(CSDConversationJoinContext *)self activity];
    [v3 appendFormat:@"%@=%@", v39, v40];
  }
  v41 = [(CSDConversationJoinContext *)self screenSharingRequest];

  if (v41)
  {
    [v3 appendFormat:@", "];
    v42 = NSStringFromSelector("screenSharingRequest");
    v43 = [(CSDConversationJoinContext *)self screenSharingRequest];
    [v3 appendFormat:@"%@=%@", v42, v43];
  }
  [v3 appendFormat:@", "];
  v44 = NSStringFromSelector("isSpatialPersonaEnabled");
  [v3 appendFormat:@"%@=%d", v44, -[CSDConversationJoinContext isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled")];

  [v3 appendFormat:@", "];
  v45 = NSStringFromSelector("isUPlusOneVisionToVisionAvailable");
  [v3 appendFormat:@"%@=%d", v45, -[CSDConversationJoinContext isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable")];

  [v3 appendFormat:@">"];
  id v46 = [v3 copy];

  return v46;
}

- (BOOL)isInvitation
{
  return self->_invitation;
}

- (void)setInvitation:(BOOL)a3
{
  self->_invitation = a3;
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isVideoPaused
{
  return self->_videoPaused;
}

- (void)setVideoPaused:(BOOL)a3
{
  self->_videoPaused = a3;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void)setWantsStagingArea:(BOOL)a3
{
  self->_wantsStagingArea = a3;
}

- (BOOL)representsTransitionFromPending
{
  return self->_representsTransitionFromPending;
}

- (void)setRepresentsTransitionFromPending:(BOOL)a3
{
  self->_representsTransitionFromPending = a3;
}

- (BOOL)isUpgrade
{
  return self->_upgrade;
}

- (void)setUpgrade:(BOOL)a3
{
  self->_upgrade = a3;
}

- (BOOL)isInitiator
{
  return self->_initiator;
}

- (void)setInitiator:(BOOL)a3
{
  self->_initiator = a3;
}

- (BOOL)isMomentsAvailable
{
  return self->_momentsAvailable;
}

- (void)setMomentsAvailable:(BOOL)a3
{
  self->_momentsAvailable = a3;
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
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

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (BOOL)isLightweight
{
  return self->_lightweight;
}

- (void)setLightweight:(BOOL)a3
{
  self->_lightweight = a3;
}

- (NSUUID)messagesGroupUUID
{
  return self->_messagesGroupUUID;
}

- (void)setMessagesGroupUUID:(id)a3
{
}

- (NSString)messagesGroupName
{
  return self->_messagesGroupName;
}

- (void)setMessagesGroupName:(id)a3
{
}

- (NSUUID)upgradeSessionUUID
{
  return self->_upgradeSessionUUID;
}

- (void)setUpgradeSessionUUID:(id)a3
{
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  self->_oneToOneModeEnabled = a3;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (TUConversationProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSSet)invitationPreferences
{
  return self->_invitationPreferences;
}

- (void)setInvitationPreferences:(id)a3
{
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

- (TUConversationParticipantAssociation)participantAssociation
{
  return self->_participantAssociation;
}

- (void)setParticipantAssociation:(id)a3
{
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (void)setCollaborationIdentifier:(id)a3
{
}

- (TUConversationActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (TUScreenSharingRequest)screenSharingRequest
{
  return self->_screenSharingRequest;
}

- (void)setScreenSharingRequest:(id)a3
{
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  self->_spatialPersonaEnabled = a3;
}

- (BOOL)isUPlusOneVisionToVisionAvailable
{
  return self->_uPlusOneVisionToVisionAvailable;
}

- (void)setUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  self->_uPlusOneVisionToVisionAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenSharingRequest, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
  objc_storeStrong((id *)&self->_participantAssociation, 0);
  objc_storeStrong((id *)&self->_invitationPreferences, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_upgradeSessionUUID, 0);
  objc_storeStrong((id *)&self->_messagesGroupName, 0);

  objc_storeStrong((id *)&self->_messagesGroupUUID, 0);
}

@end