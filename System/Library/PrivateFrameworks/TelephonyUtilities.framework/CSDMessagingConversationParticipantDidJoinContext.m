@interface CSDMessagingConversationParticipantDidJoinContext
+ (Class)lightweightMembersType;
+ (Class)membersType;
+ (Class)otherInvitedHandlesType;
- (BOOL)hasActivitySession;
- (BOOL)hasCollaborationIdentifier;
- (BOOL)hasIsGFTDowngradeToOneToOneAvailable;
- (BOOL)hasIsGondolaCallingAvailable;
- (BOOL)hasIsLightweight;
- (BOOL)hasIsMomentsAvailable;
- (BOOL)hasIsPersonaAvailable;
- (BOOL)hasIsPhotosSharePlayAvailable;
- (BOOL)hasIsScreenSharingAvailable;
- (BOOL)hasIsSpatialPersonaEnabled;
- (BOOL)hasIsUPlusNDowngradeAvailable;
- (BOOL)hasIsUPlusOneAVLessAvailable;
- (BOOL)hasIsUPlusOneScreenSharingAvailable;
- (BOOL)hasIsUPlusOneVisionToVisionAvailable;
- (BOOL)hasMessage;
- (BOOL)hasMessagesGroupName;
- (BOOL)hasMessagesGroupUUIDString;
- (BOOL)hasParticipantAssociation;
- (BOOL)hasProviderIdentifier;
- (BOOL)hasScreenSharingRequest;
- (BOOL)hasSharePlayProtocolVersion;
- (BOOL)hasSupportsLeaveContext;
- (BOOL)hasSupportsRequestToScreenShare;
- (BOOL)hasVersion;
- (BOOL)hasVideo;
- (BOOL)hasVideoEnabled;
- (BOOL)hasVisionCallEstablishmentVersion;
- (BOOL)hasVisionFeatureVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGFTDowngradeToOneToOneAvailable;
- (BOOL)isGondolaCallingAvailable;
- (BOOL)isLightweight;
- (BOOL)isMomentsAvailable;
- (BOOL)isPersonaAvailable;
- (BOOL)isPhotosSharePlayAvailable;
- (BOOL)isScreenSharingAvailable;
- (BOOL)isSpatialPersonaEnabled;
- (BOOL)isUPlusNDowngradeAvailable;
- (BOOL)isUPlusOneAVLessAvailable;
- (BOOL)isUPlusOneScreenSharingAvailable;
- (BOOL)isUPlusOneVisionToVisionAvailable;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsLeaveContext;
- (BOOL)supportsRequestToScreenShare;
- (BOOL)video;
- (BOOL)videoEnabled;
- (CSDMessagingConversationActivitySession)activitySession;
- (CSDMessagingConversationMessage)message;
- (CSDMessagingConversationParticipantAssociation)participantAssociation;
- (CSDMessagingScreenShareContext)screenSharingRequest;
- (NSMutableArray)lightweightMembers;
- (NSMutableArray)members;
- (NSMutableArray)otherInvitedHandles;
- (NSSet)otherInvitedTUHandles;
- (NSSet)tuConversationMembers;
- (NSSet)tuLightweightMembers;
- (NSString)collaborationIdentifier;
- (NSString)messagesGroupName;
- (NSString)messagesGroupUUIDString;
- (NSString)providerIdentifier;
- (id)allTUConversationMembers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lightweightMembersAtIndex:(unint64_t)a3;
- (id)membersAtIndex:(unint64_t)a3;
- (id)otherInvitedHandlesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)lightweightMembersCount;
- (unint64_t)membersCount;
- (unint64_t)otherInvitedHandlesCount;
- (unsigned)sharePlayProtocolVersion;
- (unsigned)version;
- (unsigned)visionCallEstablishmentVersion;
- (unsigned)visionFeatureVersion;
- (void)addLightweightMembers:(id)a3;
- (void)addMembers:(id)a3;
- (void)addOtherInvitedHandles:(id)a3;
- (void)clearLightweightMembers;
- (void)clearMembers;
- (void)clearOtherInvitedHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivitySession:(id)a3;
- (void)setCollaborationIdentifier:(id)a3;
- (void)setHasIsGFTDowngradeToOneToOneAvailable:(BOOL)a3;
- (void)setHasIsGondolaCallingAvailable:(BOOL)a3;
- (void)setHasIsLightweight:(BOOL)a3;
- (void)setHasIsMomentsAvailable:(BOOL)a3;
- (void)setHasIsPersonaAvailable:(BOOL)a3;
- (void)setHasIsPhotosSharePlayAvailable:(BOOL)a3;
- (void)setHasIsScreenSharingAvailable:(BOOL)a3;
- (void)setHasIsSpatialPersonaEnabled:(BOOL)a3;
- (void)setHasIsUPlusNDowngradeAvailable:(BOOL)a3;
- (void)setHasIsUPlusOneAVLessAvailable:(BOOL)a3;
- (void)setHasIsUPlusOneScreenSharingAvailable:(BOOL)a3;
- (void)setHasIsUPlusOneVisionToVisionAvailable:(BOOL)a3;
- (void)setHasSharePlayProtocolVersion:(BOOL)a3;
- (void)setHasSupportsLeaveContext:(BOOL)a3;
- (void)setHasSupportsRequestToScreenShare:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasVideo:(BOOL)a3;
- (void)setHasVideoEnabled:(BOOL)a3;
- (void)setHasVisionCallEstablishmentVersion:(BOOL)a3;
- (void)setHasVisionFeatureVersion:(BOOL)a3;
- (void)setIsGFTDowngradeToOneToOneAvailable:(BOOL)a3;
- (void)setIsGondolaCallingAvailable:(BOOL)a3;
- (void)setIsLightweight:(BOOL)a3;
- (void)setIsMomentsAvailable:(BOOL)a3;
- (void)setIsPersonaAvailable:(BOOL)a3;
- (void)setIsPhotosSharePlayAvailable:(BOOL)a3;
- (void)setIsScreenSharingAvailable:(BOOL)a3;
- (void)setIsSpatialPersonaEnabled:(BOOL)a3;
- (void)setIsUPlusNDowngradeAvailable:(BOOL)a3;
- (void)setIsUPlusOneAVLessAvailable:(BOOL)a3;
- (void)setIsUPlusOneScreenSharingAvailable:(BOOL)a3;
- (void)setIsUPlusOneVisionToVisionAvailable:(BOOL)a3;
- (void)setLightweightMembers:(id)a3;
- (void)setMembers:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessagesGroupName:(id)a3;
- (void)setMessagesGroupUUIDString:(id)a3;
- (void)setOtherInvitedHandles:(id)a3;
- (void)setOtherInvitedTUHandles:(id)a3;
- (void)setParticipantAssociation:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setScreenSharingRequest:(id)a3;
- (void)setSharePlayProtocolVersion:(unsigned int)a3;
- (void)setSupportsLeaveContext:(BOOL)a3;
- (void)setSupportsRequestToScreenShare:(BOOL)a3;
- (void)setTuConversationMembers:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVisionCallEstablishmentVersion:(unsigned int)a3;
- (void)setVisionFeatureVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationParticipantDidJoinContext

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearMembers
{
}

- (void)addMembers:(id)a3
{
  id v4 = a3;
  members = self->_members;
  id v8 = v4;
  if (!members)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_members;
    self->_members = v6;

    id v4 = v8;
    members = self->_members;
  }
  [(NSMutableArray *)members addObject:v4];
}

- (unint64_t)membersCount
{
  return (unint64_t)[(NSMutableArray *)self->_members count];
}

- (id)membersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_members objectAtIndex:a3];
}

+ (Class)membersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (BOOL)hasMessagesGroupUUIDString
{
  return self->_messagesGroupUUIDString != 0;
}

- (BOOL)hasMessagesGroupName
{
  return self->_messagesGroupName != 0;
}

- (void)setIsMomentsAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_isMomentsAvailable = a3;
}

- (void)setHasIsMomentsAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasIsMomentsAvailable
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasActivitySession
{
  return self->_activitySession != 0;
}

- (void)setVideo:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_video = a3;
}

- (void)setHasVideo:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasVideo
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setIsScreenSharingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_isScreenSharingAvailable = a3;
}

- (void)setHasIsScreenSharingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIsScreenSharingAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasProviderIdentifier
{
  return self->_providerIdentifier != 0;
}

- (void)clearOtherInvitedHandles
{
}

- (void)addOtherInvitedHandles:(id)a3
{
  id v4 = a3;
  otherInvitedHandles = self->_otherInvitedHandles;
  id v8 = v4;
  if (!otherInvitedHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_otherInvitedHandles;
    self->_otherInvitedHandles = v6;

    id v4 = v8;
    otherInvitedHandles = self->_otherInvitedHandles;
  }
  [(NSMutableArray *)otherInvitedHandles addObject:v4];
}

- (unint64_t)otherInvitedHandlesCount
{
  return (unint64_t)[(NSMutableArray *)self->_otherInvitedHandles count];
}

- (id)otherInvitedHandlesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_otherInvitedHandles objectAtIndex:a3];
}

+ (Class)otherInvitedHandlesType
{
  return (Class)objc_opt_class();
}

- (void)setIsPersonaAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_isPersonaAvailable = a3;
}

- (void)setHasIsPersonaAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasIsPersonaAvailable
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)clearLightweightMembers
{
}

- (void)addLightweightMembers:(id)a3
{
  id v4 = a3;
  lightweightMembers = self->_lightweightMembers;
  id v8 = v4;
  if (!lightweightMembers)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_lightweightMembers;
    self->_lightweightMembers = v6;

    id v4 = v8;
    lightweightMembers = self->_lightweightMembers;
  }
  [(NSMutableArray *)lightweightMembers addObject:v4];
}

- (unint64_t)lightweightMembersCount
{
  return (unint64_t)[(NSMutableArray *)self->_lightweightMembers count];
}

- (id)lightweightMembersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_lightweightMembers objectAtIndex:a3];
}

+ (Class)lightweightMembersType
{
  return (Class)objc_opt_class();
}

- (void)setIsLightweight:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_isLightweight = a3;
}

- (void)setHasIsLightweight:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasIsLightweight
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsGondolaCallingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_isGondolaCallingAvailable = a3;
}

- (void)setHasIsGondolaCallingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasIsGondolaCallingAvailable
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setVideoEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_videoEnabled = a3;
}

- (void)setHasVideoEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVideoEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSharePlayProtocolVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_sharePlayProtocolVersion = a3;
}

- (void)setHasSharePlayProtocolVersion:(BOOL)a3
{
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasSharePlayProtocolVersion
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIsGFTDowngradeToOneToOneAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_isGFTDowngradeToOneToOneAvailable = a3;
}

- (void)setHasIsGFTDowngradeToOneToOneAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasIsGFTDowngradeToOneToOneAvailable
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasParticipantAssociation
{
  return self->_participantAssociation != 0;
}

- (void)setIsUPlusNDowngradeAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isUPlusNDowngradeAvailable = a3;
}

- (void)setHasIsUPlusNDowngradeAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsUPlusNDowngradeAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasCollaborationIdentifier
{
  return self->_collaborationIdentifier != 0;
}

- (void)setSupportsLeaveContext:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_supportsLeaveContext = a3;
}

- (void)setHasSupportsLeaveContext:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSupportsLeaveContext
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsUPlusOneScreenSharingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isUPlusOneScreenSharingAvailable = a3;
}

- (void)setHasIsUPlusOneScreenSharingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsUPlusOneScreenSharingAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsSpatialPersonaEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isSpatialPersonaEnabled = a3;
}

- (void)setHasIsSpatialPersonaEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsSpatialPersonaEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsUPlusOneAVLessAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isUPlusOneAVLessAvailable = a3;
}

- (void)setHasIsUPlusOneAVLessAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsUPlusOneAVLessAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setVisionFeatureVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_visionFeatureVersion = a3;
}

- (void)setHasVisionFeatureVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasVisionFeatureVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setVisionCallEstablishmentVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_visionCallEstablishmentVersion = a3;
}

- (void)setHasVisionCallEstablishmentVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasVisionCallEstablishmentVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasScreenSharingRequest
{
  return self->_screenSharingRequest != 0;
}

- (void)setIsUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isUPlusOneVisionToVisionAvailable = a3;
}

- (void)setHasIsUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsUPlusOneVisionToVisionAvailable
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSupportsRequestToScreenShare:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_supportsRequestToScreenShare = a3;
}

- (void)setHasSupportsRequestToScreenShare:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSupportsRequestToScreenShare
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsPhotosSharePlayAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_isPhotosSharePlayAvailable = a3;
}

- (void)setHasIsPhotosSharePlayAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91AFCFBBFCC236A698A91430C8570A63)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasIsPhotosSharePlayAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  if ([(NSMutableArray *)self->_members count])
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_members, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v6 = self->_members;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v71 objects:v77 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v72;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v72 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v71 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v71 objects:v77 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"members"];
  }
  message = self->_message;
  if (message)
  {
    v13 = [(CSDMessagingConversationMessage *)message dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"message"];
  }
  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if (messagesGroupUUIDString) {
    [v3 setObject:messagesGroupUUIDString forKey:@"messagesGroupUUIDString"];
  }
  messagesGroupName = self->_messagesGroupName;
  if (messagesGroupName) {
    [v3 setObject:messagesGroupName forKey:@"messagesGroupName"];
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    v16 = +[NSNumber numberWithBool:self->_isMomentsAvailable];
    [v3 setObject:v16 forKey:@"isMomentsAvailable"];
  }
  activitySession = self->_activitySession;
  if (activitySession)
  {
    v18 = [(CSDMessagingConversationActivitySession *)activitySession dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"activitySession"];
  }
  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v20 = +[NSNumber numberWithBool:self->_video];
    [v3 setObject:v20 forKey:@"video"];

    $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v21 = +[NSNumber numberWithBool:self->_isScreenSharingAvailable];
    [v3 setObject:v21 forKey:@"isScreenSharingAvailable"];
  }
  providerIdentifier = self->_providerIdentifier;
  if (providerIdentifier) {
    [v3 setObject:providerIdentifier forKey:@"providerIdentifier"];
  }
  if ([(NSMutableArray *)self->_otherInvitedHandles count])
  {
    id v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_otherInvitedHandles, "count"));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v24 = self->_otherInvitedHandles;
    id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v68;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v68 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v23 addObject:v29];
        }
        id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKey:@"otherInvitedHandles"];
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    v30 = +[NSNumber numberWithBool:self->_isPersonaAvailable];
    [v3 setObject:v30 forKey:@"isPersonaAvailable"];
  }
  if ([(NSMutableArray *)self->_lightweightMembers count])
  {
    id v31 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_lightweightMembers, "count"));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v32 = self->_lightweightMembers;
    id v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v64;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v64 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * (void)k), "dictionaryRepresentation", (void)v63);
          [v31 addObject:v37];
        }
        id v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v34);
    }

    [v3 setObject:v31 forKey:@"lightweightMembers"];
  }
  $91AFCFBBFCC236A698A91430C8570A63 v38 = self->_has;
  if ((*(unsigned char *)&v38 & 0x40) != 0)
  {
    v52 = +[NSNumber numberWithBool:self->_isLightweight];
    [v3 setObject:v52 forKey:@"isLightweight"];

    $91AFCFBBFCC236A698A91430C8570A63 v38 = self->_has;
    if ((*(unsigned char *)&v38 & 0x20) == 0)
    {
LABEL_50:
      if ((*(_DWORD *)&v38 & 0x80000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_76;
    }
  }
  else if ((*(unsigned char *)&v38 & 0x20) == 0)
  {
    goto LABEL_50;
  }
  v53 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isGondolaCallingAvailable, (void)v63);
  [v3 setObject:v53 forKey:@"isGondolaCallingAvailable"];

  $91AFCFBBFCC236A698A91430C8570A63 v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x80000) == 0)
  {
LABEL_51:
    if ((*(unsigned char *)&v38 & 1) == 0) {
      goto LABEL_52;
    }
    goto LABEL_77;
  }
LABEL_76:
  v54 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_videoEnabled, (void)v63);
  [v3 setObject:v54 forKey:@"videoEnabled"];

  $91AFCFBBFCC236A698A91430C8570A63 v38 = self->_has;
  if ((*(unsigned char *)&v38 & 1) == 0)
  {
LABEL_52:
    if ((*(unsigned char *)&v38 & 0x10) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_77:
  v55 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sharePlayProtocolVersion, (void)v63);
  [v3 setObject:v55 forKey:@"sharePlayProtocolVersion"];

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_53:
    v39 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isGFTDowngradeToOneToOneAvailable, (void)v63);
    [v3 setObject:v39 forKey:@"isGFTDowngradeToOneToOneAvailable"];
  }
LABEL_54:
  participantAssociation = self->_participantAssociation;
  if (participantAssociation)
  {
    v41 = [(CSDMessagingConversationParticipantAssociation *)participantAssociation dictionaryRepresentation];
    [v3 setObject:v41 forKey:@"participantAssociation"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    v42 = +[NSNumber numberWithBool:self->_isUPlusNDowngradeAvailable];
    [v3 setObject:v42 forKey:@"isUPlusNDowngradeAvailable"];
  }
  collaborationIdentifier = self->_collaborationIdentifier;
  if (collaborationIdentifier) {
    [v3 setObject:collaborationIdentifier forKey:@"collaborationIdentifier"];
  }
  $91AFCFBBFCC236A698A91430C8570A63 v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x10000) != 0)
  {
    v56 = +[NSNumber numberWithBool:self->_supportsLeaveContext];
    [v3 setObject:v56 forKey:@"supportsLeaveContext"];

    $91AFCFBBFCC236A698A91430C8570A63 v44 = self->_has;
    if ((*(_WORD *)&v44 & 0x4000) == 0)
    {
LABEL_62:
      if ((*(_WORD *)&v44 & 0x800) == 0) {
        goto LABEL_63;
      }
      goto LABEL_81;
    }
  }
  else if ((*(_WORD *)&v44 & 0x4000) == 0)
  {
    goto LABEL_62;
  }
  v57 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isUPlusOneScreenSharingAvailable, (void)v63);
  [v3 setObject:v57 forKey:@"isUPlusOneScreenSharingAvailable"];

  $91AFCFBBFCC236A698A91430C8570A63 v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x800) == 0)
  {
LABEL_63:
    if ((*(_WORD *)&v44 & 0x2000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_82;
  }
LABEL_81:
  v58 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isSpatialPersonaEnabled, (void)v63);
  [v3 setObject:v58 forKey:@"isSpatialPersonaEnabled"];

  $91AFCFBBFCC236A698A91430C8570A63 v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x2000) == 0)
  {
LABEL_64:
    if ((*(unsigned char *)&v44 & 8) == 0) {
      goto LABEL_65;
    }
    goto LABEL_83;
  }
LABEL_82:
  v59 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isUPlusOneAVLessAvailable, (void)v63);
  [v3 setObject:v59 forKey:@"isUPlusOneAVLessAvailable"];

  $91AFCFBBFCC236A698A91430C8570A63 v44 = self->_has;
  if ((*(unsigned char *)&v44 & 8) == 0)
  {
LABEL_65:
    if ((*(unsigned char *)&v44 & 4) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_83:
  v60 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_visionFeatureVersion, (void)v63);
  [v3 setObject:v60 forKey:@"visionFeatureVersion"];

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_66:
    v45 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_visionCallEstablishmentVersion, (void)v63);
    [v3 setObject:v45 forKey:@"visionCallEstablishmentVersion"];
  }
LABEL_67:
  screenSharingRequest = self->_screenSharingRequest;
  if (screenSharingRequest)
  {
    v47 = [(CSDMessagingScreenShareContext *)screenSharingRequest dictionaryRepresentation];
    [v3 setObject:v47 forKey:@"screenSharingRequest"];
  }
  $91AFCFBBFCC236A698A91430C8570A63 v48 = self->_has;
  if ((*(_WORD *)&v48 & 0x8000) == 0)
  {
    if ((*(_DWORD *)&v48 & 0x20000) == 0) {
      goto LABEL_71;
    }
LABEL_86:
    v62 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_supportsRequestToScreenShare, (void)v63);
    [v3 setObject:v62 forKey:@"supportsRequestToScreenShare"];

    if ((*(_DWORD *)&self->_has & 0x200) == 0) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
  v61 = +[NSNumber numberWithBool:self->_isUPlusOneVisionToVisionAvailable];
  [v3 setObject:v61 forKey:@"isUPlusOneVisionToVisionAvailable"];

  $91AFCFBBFCC236A698A91430C8570A63 v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x20000) != 0) {
    goto LABEL_86;
  }
LABEL_71:
  if ((*(_WORD *)&v48 & 0x200) != 0)
  {
LABEL_72:
    v49 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isPhotosSharePlayAvailable, (void)v63);
    [v3 setObject:v49 forKey:@"isPhotosSharePlayAvailable"];
  }
LABEL_73:
  id v50 = v3;

  return v50;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C1A8C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = self->_members;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  if (self->_message) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_messagesGroupUUIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_messagesGroupName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_activitySession) {
    PBDataWriterWriteSubmessage();
  }
  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_providerIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v11 = self->_otherInvitedHandles;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v13);
  }

  if (*((unsigned char *)&self->_has + 1)) {
    PBDataWriterWriteBOOLField();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v16 = self->_lightweightMembers;
  v17 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v17)
  {
    v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      v18 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v18);
  }

  $91AFCFBBFCC236A698A91430C8570A63 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    $91AFCFBBFCC236A698A91430C8570A63 v21 = self->_has;
    if ((*(unsigned char *)&v21 & 0x20) == 0)
    {
LABEL_44:
      if ((*(_DWORD *)&v21 & 0x80000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_70;
    }
  }
  else if ((*(unsigned char *)&v21 & 0x20) == 0)
  {
    goto LABEL_44;
  }
  PBDataWriterWriteBOOLField();
  $91AFCFBBFCC236A698A91430C8570A63 v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) == 0)
  {
LABEL_45:
    if ((*(unsigned char *)&v21 & 1) == 0) {
      goto LABEL_46;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteBOOLField();
  $91AFCFBBFCC236A698A91430C8570A63 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 1) == 0)
  {
LABEL_46:
    if ((*(unsigned char *)&v21 & 0x10) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_47:
  }
    PBDataWriterWriteBOOLField();
LABEL_48:
  if (self->_participantAssociation) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_collaborationIdentifier) {
    PBDataWriterWriteStringField();
  }
  $91AFCFBBFCC236A698A91430C8570A63 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $91AFCFBBFCC236A698A91430C8570A63 v22 = self->_has;
    if ((*(_WORD *)&v22 & 0x4000) == 0)
    {
LABEL_56:
      if ((*(_WORD *)&v22 & 0x800) == 0) {
        goto LABEL_57;
      }
      goto LABEL_75;
    }
  }
  else if ((*(_WORD *)&v22 & 0x4000) == 0)
  {
    goto LABEL_56;
  }
  PBDataWriterWriteBOOLField();
  $91AFCFBBFCC236A698A91430C8570A63 v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x800) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v22 & 0x2000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  $91AFCFBBFCC236A698A91430C8570A63 v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x2000) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v22 & 8) == 0) {
      goto LABEL_59;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  $91AFCFBBFCC236A698A91430C8570A63 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 8) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v22 & 4) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_60:
  }
    PBDataWriterWriteUint32Field();
LABEL_61:
  if (self->_screenSharingRequest) {
    PBDataWriterWriteSubmessage();
  }
  $91AFCFBBFCC236A698A91430C8570A63 v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x8000) == 0)
  {
    if ((*(_DWORD *)&v23 & 0x20000) == 0) {
      goto LABEL_65;
    }
LABEL_80:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x200) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
  PBDataWriterWriteBOOLField();
  $91AFCFBBFCC236A698A91430C8570A63 v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x20000) != 0) {
    goto LABEL_80;
  }
LABEL_65:
  if ((*(_WORD *)&v23 & 0x200) != 0) {
LABEL_66:
  }
    PBDataWriterWriteBOOLField();
LABEL_67:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[25] = self->_version;
    v4[32] |= 2u;
  }
  id v23 = v4;
  if ([(CSDMessagingConversationParticipantDidJoinContext *)self membersCount])
  {
    [v23 clearMembers];
    unint64_t v5 = [(CSDMessagingConversationParticipantDidJoinContext *)self membersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(CSDMessagingConversationParticipantDidJoinContext *)self membersAtIndex:i];
        [v23 addMembers:v8];
      }
    }
  }
  if (self->_message) {
    objc_msgSend(v23, "setMessage:");
  }
  uint64_t v9 = v23;
  if (self->_messagesGroupUUIDString)
  {
    objc_msgSend(v23, "setMessagesGroupUUIDString:");
    uint64_t v9 = v23;
  }
  if (self->_messagesGroupName)
  {
    objc_msgSend(v23, "setMessagesGroupName:");
    uint64_t v9 = v23;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    v9[115] = self->_isMomentsAvailable;
    *((_DWORD *)v9 + 32) |= 0x80u;
  }
  if (self->_activitySession)
  {
    objc_msgSend(v23, "setActivitySession:");
    uint64_t v9 = v23;
  }
  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v9[126] = self->_video;
    *((_DWORD *)v9 + 32) |= 0x40000u;
    $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v9[118] = self->_isScreenSharingAvailable;
    *((_DWORD *)v9 + 32) |= 0x400u;
  }
  if (self->_providerIdentifier) {
    objc_msgSend(v23, "setProviderIdentifier:");
  }
  if ([(CSDMessagingConversationParticipantDidJoinContext *)self otherInvitedHandlesCount])
  {
    [v23 clearOtherInvitedHandles];
    unint64_t v11 = [(CSDMessagingConversationParticipantDidJoinContext *)self otherInvitedHandlesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(CSDMessagingConversationParticipantDidJoinContext *)self otherInvitedHandlesAtIndex:j];
        [v23 addOtherInvitedHandles:v14];
      }
    }
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    *((unsigned char *)v23 + 116) = self->_isPersonaAvailable;
    *((_DWORD *)v23 + 32) |= 0x100u;
  }
  if ([(CSDMessagingConversationParticipantDidJoinContext *)self lightweightMembersCount])
  {
    [v23 clearLightweightMembers];
    unint64_t v15 = [(CSDMessagingConversationParticipantDidJoinContext *)self lightweightMembersCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        v18 = [(CSDMessagingConversationParticipantDidJoinContext *)self lightweightMembersAtIndex:k];
        [v23 addLightweightMembers:v18];
      }
    }
  }
  $91AFCFBBFCC236A698A91430C8570A63 v19 = self->_has;
  v20 = v23;
  if ((*(unsigned char *)&v19 & 0x40) != 0)
  {
    *((unsigned char *)v23 + 114) = self->_isLightweight;
    *((_DWORD *)v23 + 32) |= 0x40u;
    $91AFCFBBFCC236A698A91430C8570A63 v19 = self->_has;
    if ((*(unsigned char *)&v19 & 0x20) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v19 & 0x80000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_63;
    }
  }
  else if ((*(unsigned char *)&v19 & 0x20) == 0)
  {
    goto LABEL_35;
  }
  *((unsigned char *)v23 + 113) = self->_isGondolaCallingAvailable;
  *((_DWORD *)v23 + 32) |= 0x20u;
  $91AFCFBBFCC236A698A91430C8570A63 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x80000) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v19 & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((unsigned char *)v23 + 127) = self->_videoEnabled;
  *((_DWORD *)v23 + 32) |= 0x80000u;
  $91AFCFBBFCC236A698A91430C8570A63 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 1) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&v19 & 0x10) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_64:
  *((_DWORD *)v23 + 24) = self->_sharePlayProtocolVersion;
  *((_DWORD *)v23 + 32) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_38:
    *((unsigned char *)v23 + 112) = self->_isGFTDowngradeToOneToOneAvailable;
    *((_DWORD *)v23 + 32) |= 0x10u;
  }
LABEL_39:
  if (self->_participantAssociation)
  {
    objc_msgSend(v23, "setParticipantAssociation:");
    v20 = v23;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    v20[120] = self->_isUPlusNDowngradeAvailable;
    *((_DWORD *)v20 + 32) |= 0x1000u;
  }
  if (self->_collaborationIdentifier)
  {
    objc_msgSend(v23, "setCollaborationIdentifier:");
    v20 = v23;
  }
  $91AFCFBBFCC236A698A91430C8570A63 v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x10000) != 0)
  {
    v20[124] = self->_supportsLeaveContext;
    *((_DWORD *)v20 + 32) |= 0x10000u;
    $91AFCFBBFCC236A698A91430C8570A63 v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x4000) == 0)
    {
LABEL_47:
      if ((*(_WORD *)&v21 & 0x800) == 0) {
        goto LABEL_48;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_WORD *)&v21 & 0x4000) == 0)
  {
    goto LABEL_47;
  }
  v20[122] = self->_isUPlusOneScreenSharingAvailable;
  *((_DWORD *)v20 + 32) |= 0x4000u;
  $91AFCFBBFCC236A698A91430C8570A63 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x800) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v21 & 0x2000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_69;
  }
LABEL_68:
  v20[119] = self->_isSpatialPersonaEnabled;
  *((_DWORD *)v20 + 32) |= 0x800u;
  $91AFCFBBFCC236A698A91430C8570A63 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x2000) == 0)
  {
LABEL_49:
    if ((*(unsigned char *)&v21 & 8) == 0) {
      goto LABEL_50;
    }
    goto LABEL_70;
  }
LABEL_69:
  v20[121] = self->_isUPlusOneAVLessAvailable;
  *((_DWORD *)v20 + 32) |= 0x2000u;
  $91AFCFBBFCC236A698A91430C8570A63 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 8) == 0)
  {
LABEL_50:
    if ((*(unsigned char *)&v21 & 4) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_70:
  *((_DWORD *)v20 + 27) = self->_visionFeatureVersion;
  *((_DWORD *)v20 + 32) |= 8u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_51:
    *((_DWORD *)v20 + 26) = self->_visionCallEstablishmentVersion;
    *((_DWORD *)v20 + 32) |= 4u;
  }
LABEL_52:
  if (self->_screenSharingRequest)
  {
    objc_msgSend(v23, "setScreenSharingRequest:");
    v20 = v23;
  }
  $91AFCFBBFCC236A698A91430C8570A63 v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x8000) != 0)
  {
    v20[123] = self->_isUPlusOneVisionToVisionAvailable;
    *((_DWORD *)v20 + 32) |= 0x8000u;
    $91AFCFBBFCC236A698A91430C8570A63 v22 = self->_has;
    if ((*(_DWORD *)&v22 & 0x20000) == 0)
    {
LABEL_56:
      if ((*(_WORD *)&v22 & 0x200) == 0) {
        goto LABEL_58;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_DWORD *)&v22 & 0x20000) == 0)
  {
    goto LABEL_56;
  }
  v20[125] = self->_supportsRequestToScreenShare;
  *((_DWORD *)v20 + 32) |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_57:
    v20[117] = self->_isPhotosSharePlayAvailable;
    *((_DWORD *)v20 + 32) |= 0x200u;
  }
LABEL_58:
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[25] = self->_version;
    v5[32] |= 2u;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v7 = self->_members;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v55;
    do
    {
      unint64_t v11 = 0;
      do
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v54 + 1) + 8 * (void)v11) copyWithZone:a3];
        [v6 addMembers:v12];

        unint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v9);
  }

  id v13 = [(CSDMessagingConversationMessage *)self->_message copyWithZone:a3];
  uint64_t v14 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v13;

  id v15 = [(NSString *)self->_messagesGroupUUIDString copyWithZone:a3];
  unint64_t v16 = (void *)*((void *)v6 + 7);
  *((void *)v6 + 7) = v15;

  id v17 = [(NSString *)self->_messagesGroupName copyWithZone:a3];
  v18 = (void *)*((void *)v6 + 6);
  *((void *)v6 + 6) = v17;

  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *((unsigned char *)v6 + 115) = self->_isMomentsAvailable;
    *((_DWORD *)v6 + 32) |= 0x80u;
  }
  id v19 = [(CSDMessagingConversationActivitySession *)self->_activitySession copyWithZone:a3];
  v20 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v19;

  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *((unsigned char *)v6 + 126) = self->_video;
    *((_DWORD *)v6 + 32) |= 0x40000u;
    $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((unsigned char *)v6 + 118) = self->_isScreenSharingAvailable;
    *((_DWORD *)v6 + 32) |= 0x400u;
  }
  id v22 = [(NSString *)self->_providerIdentifier copyWithZone:a3];
  id v23 = (void *)*((void *)v6 + 10);
  *((void *)v6 + 10) = v22;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v24 = self->_otherInvitedHandles;
  id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v51;
    do
    {
      long long v28 = 0;
      do
      {
        if (*(void *)v51 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)v28) copyWithZone:a3];
        [v6 addOtherInvitedHandles:v29];

        long long v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v26);
  }

  if (*((unsigned char *)&self->_has + 1))
  {
    *((unsigned char *)v6 + 116) = self->_isPersonaAvailable;
    *((_DWORD *)v6 + 32) |= 0x100u;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v30 = self->_lightweightMembers;
  id v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v47;
    do
    {
      long long v34 = 0;
      do
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * (void)v34), "copyWithZone:", a3, (void)v46);
        [v6 addLightweightMembers:v35];

        long long v34 = (char *)v34 + 1;
      }
      while (v32 != v34);
      id v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v32);
  }

  $91AFCFBBFCC236A698A91430C8570A63 v36 = self->_has;
  if ((*(unsigned char *)&v36 & 0x40) != 0)
  {
    *((unsigned char *)v6 + 114) = self->_isLightweight;
    *((_DWORD *)v6 + 32) |= 0x40u;
    $91AFCFBBFCC236A698A91430C8570A63 v36 = self->_has;
    if ((*(unsigned char *)&v36 & 0x20) == 0)
    {
LABEL_34:
      if ((*(_DWORD *)&v36 & 0x80000) == 0) {
        goto LABEL_35;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&v36 & 0x20) == 0)
  {
    goto LABEL_34;
  }
  *((unsigned char *)v6 + 113) = self->_isGondolaCallingAvailable;
  *((_DWORD *)v6 + 32) |= 0x20u;
  $91AFCFBBFCC236A698A91430C8570A63 v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x80000) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&v36 & 1) == 0) {
      goto LABEL_36;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((unsigned char *)v6 + 127) = self->_videoEnabled;
  *((_DWORD *)v6 + 32) |= 0x80000u;
  $91AFCFBBFCC236A698A91430C8570A63 v36 = self->_has;
  if ((*(unsigned char *)&v36 & 1) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v36 & 0x10) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_55:
  *((_DWORD *)v6 + 24) = self->_sharePlayProtocolVersion;
  *((_DWORD *)v6 + 32) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_37:
    *((unsigned char *)v6 + 112) = self->_isGFTDowngradeToOneToOneAvailable;
    *((_DWORD *)v6 + 32) |= 0x10u;
  }
LABEL_38:
  id v37 = -[CSDMessagingConversationParticipantAssociation copyWithZone:](self->_participantAssociation, "copyWithZone:", a3, (void)v46);
  $91AFCFBBFCC236A698A91430C8570A63 v38 = (void *)*((void *)v6 + 9);
  *((void *)v6 + 9) = v37;

  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    *((unsigned char *)v6 + 120) = self->_isUPlusNDowngradeAvailable;
    *((_DWORD *)v6 + 32) |= 0x1000u;
  }
  id v39 = [(NSString *)self->_collaborationIdentifier copyWithZone:a3];
  v40 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v39;

  $91AFCFBBFCC236A698A91430C8570A63 v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x10000) != 0)
  {
    *((unsigned char *)v6 + 124) = self->_supportsLeaveContext;
    *((_DWORD *)v6 + 32) |= 0x10000u;
    $91AFCFBBFCC236A698A91430C8570A63 v41 = self->_has;
    if ((*(_WORD *)&v41 & 0x4000) == 0)
    {
LABEL_42:
      if ((*(_WORD *)&v41 & 0x800) == 0) {
        goto LABEL_43;
      }
      goto LABEL_59;
    }
  }
  else if ((*(_WORD *)&v41 & 0x4000) == 0)
  {
    goto LABEL_42;
  }
  *((unsigned char *)v6 + 122) = self->_isUPlusOneScreenSharingAvailable;
  *((_DWORD *)v6 + 32) |= 0x4000u;
  $91AFCFBBFCC236A698A91430C8570A63 v41 = self->_has;
  if ((*(_WORD *)&v41 & 0x800) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&v41 & 0x2000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((unsigned char *)v6 + 119) = self->_isSpatialPersonaEnabled;
  *((_DWORD *)v6 + 32) |= 0x800u;
  $91AFCFBBFCC236A698A91430C8570A63 v41 = self->_has;
  if ((*(_WORD *)&v41 & 0x2000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v41 & 8) == 0) {
      goto LABEL_45;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((unsigned char *)v6 + 121) = self->_isUPlusOneAVLessAvailable;
  *((_DWORD *)v6 + 32) |= 0x2000u;
  $91AFCFBBFCC236A698A91430C8570A63 v41 = self->_has;
  if ((*(unsigned char *)&v41 & 8) == 0)
  {
LABEL_45:
    if ((*(unsigned char *)&v41 & 4) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_61:
  *((_DWORD *)v6 + 27) = self->_visionFeatureVersion;
  *((_DWORD *)v6 + 32) |= 8u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_46:
    *((_DWORD *)v6 + 26) = self->_visionCallEstablishmentVersion;
    *((_DWORD *)v6 + 32) |= 4u;
  }
LABEL_47:
  id v42 = [(CSDMessagingScreenShareContext *)self->_screenSharingRequest copyWithZone:a3];
  v43 = (void *)*((void *)v6 + 11);
  *((void *)v6 + 11) = v42;

  $91AFCFBBFCC236A698A91430C8570A63 v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x8000) == 0)
  {
    if ((*(_DWORD *)&v44 & 0x20000) == 0) {
      goto LABEL_49;
    }
LABEL_64:
    *((unsigned char *)v6 + 125) = self->_supportsRequestToScreenShare;
    *((_DWORD *)v6 + 32) |= 0x20000u;
    if ((*(_DWORD *)&self->_has & 0x200) == 0) {
      return v6;
    }
    goto LABEL_50;
  }
  *((unsigned char *)v6 + 123) = self->_isUPlusOneVisionToVisionAvailable;
  *((_DWORD *)v6 + 32) |= 0x8000u;
  $91AFCFBBFCC236A698A91430C8570A63 v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x20000) != 0) {
    goto LABEL_64;
  }
LABEL_49:
  if ((*(_WORD *)&v44 & 0x200) != 0)
  {
LABEL_50:
    *((unsigned char *)v6 + 117) = self->_isPhotosSharePlayAvailable;
    *((_DWORD *)v6 + 32) |= 0x200u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_172;
  }
  int v5 = *((_DWORD *)v4 + 32);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_version != *((_DWORD *)v4 + 25)) {
      goto LABEL_172;
    }
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_172;
  }
  members = self->_members;
  if ((unint64_t)members | *((void *)v4 + 4) && !-[NSMutableArray isEqual:](members, "isEqual:")) {
    goto LABEL_172;
  }
  message = self->_message;
  if ((unint64_t)message | *((void *)v4 + 5))
  {
    if (!-[CSDMessagingConversationMessage isEqual:](message, "isEqual:")) {
      goto LABEL_172;
    }
  }
  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if ((unint64_t)messagesGroupUUIDString | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](messagesGroupUUIDString, "isEqual:")) {
      goto LABEL_172;
    }
  }
  messagesGroupName = self->_messagesGroupName;
  if ((unint64_t)messagesGroupName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](messagesGroupName, "isEqual:")) {
      goto LABEL_172;
    }
  }
  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  int v11 = *((_DWORD *)v4 + 32);
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0) {
      goto LABEL_172;
    }
    if (self->_isMomentsAvailable)
    {
      if (!*((unsigned char *)v4 + 115)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 115))
    {
      goto LABEL_172;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_172;
  }
  activitySession = self->_activitySession;
  if ((unint64_t)activitySession | *((void *)v4 + 1))
  {
    if (!-[CSDMessagingConversationActivitySession isEqual:](activitySession, "isEqual:")) {
      goto LABEL_172;
    }
    $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  }
  int v13 = *((_DWORD *)v4 + 32);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v13 & 0x40000) == 0) {
      goto LABEL_172;
    }
    if (self->_video)
    {
      if (!*((unsigned char *)v4 + 126)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 126))
    {
      goto LABEL_172;
    }
  }
  else if ((v13 & 0x40000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0) {
      goto LABEL_172;
    }
    if (self->_isScreenSharingAvailable)
    {
      if (!*((unsigned char *)v4 + 118)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 118))
    {
      goto LABEL_172;
    }
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_172;
  }
  providerIdentifier = self->_providerIdentifier;
  if ((unint64_t)providerIdentifier | *((void *)v4 + 10)
    && !-[NSString isEqual:](providerIdentifier, "isEqual:"))
  {
    goto LABEL_172;
  }
  otherInvitedHandles = self->_otherInvitedHandles;
  if ((unint64_t)otherInvitedHandles | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](otherInvitedHandles, "isEqual:")) {
      goto LABEL_172;
    }
  }
  $91AFCFBBFCC236A698A91430C8570A63 v16 = self->_has;
  int v17 = *((_DWORD *)v4 + 32);
  if ((*(_WORD *)&v16 & 0x100) != 0)
  {
    if ((v17 & 0x100) == 0) {
      goto LABEL_172;
    }
    if (self->_isPersonaAvailable)
    {
      if (!*((unsigned char *)v4 + 116)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 116))
    {
      goto LABEL_172;
    }
  }
  else if ((v17 & 0x100) != 0)
  {
    goto LABEL_172;
  }
  lightweightMembers = self->_lightweightMembers;
  if ((unint64_t)lightweightMembers | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](lightweightMembers, "isEqual:")) {
      goto LABEL_172;
    }
    $91AFCFBBFCC236A698A91430C8570A63 v16 = self->_has;
  }
  int v19 = *((_DWORD *)v4 + 32);
  if ((*(unsigned char *)&v16 & 0x40) != 0)
  {
    if ((v19 & 0x40) == 0) {
      goto LABEL_172;
    }
    if (self->_isLightweight)
    {
      if (!*((unsigned char *)v4 + 114)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 114))
    {
      goto LABEL_172;
    }
  }
  else if ((v19 & 0x40) != 0)
  {
    goto LABEL_172;
  }
  if ((*(unsigned char *)&v16 & 0x20) != 0)
  {
    if ((v19 & 0x20) == 0) {
      goto LABEL_172;
    }
    if (self->_isGondolaCallingAvailable)
    {
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 113))
    {
      goto LABEL_172;
    }
  }
  else if ((v19 & 0x20) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_DWORD *)&v16 & 0x80000) != 0)
  {
    if ((v19 & 0x80000) == 0) {
      goto LABEL_172;
    }
    if (self->_videoEnabled)
    {
      if (!*((unsigned char *)v4 + 127)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 127))
    {
      goto LABEL_172;
    }
  }
  else if ((v19 & 0x80000) != 0)
  {
    goto LABEL_172;
  }
  if (*(unsigned char *)&v16)
  {
    if ((v19 & 1) == 0 || self->_sharePlayProtocolVersion != *((_DWORD *)v4 + 24)) {
      goto LABEL_172;
    }
  }
  else if (v19)
  {
    goto LABEL_172;
  }
  if ((*(unsigned char *)&v16 & 0x10) != 0)
  {
    if ((v19 & 0x10) == 0) {
      goto LABEL_172;
    }
    if (self->_isGFTDowngradeToOneToOneAvailable)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_172;
    }
  }
  else if ((v19 & 0x10) != 0)
  {
    goto LABEL_172;
  }
  participantAssociation = self->_participantAssociation;
  if ((unint64_t)participantAssociation | *((void *)v4 + 9))
  {
    if (!-[CSDMessagingConversationParticipantAssociation isEqual:](participantAssociation, "isEqual:")) {
      goto LABEL_172;
    }
    $91AFCFBBFCC236A698A91430C8570A63 v16 = self->_has;
  }
  int v21 = *((_DWORD *)v4 + 32);
  if ((*(_WORD *)&v16 & 0x1000) != 0)
  {
    if ((v21 & 0x1000) == 0) {
      goto LABEL_172;
    }
    if (self->_isUPlusNDowngradeAvailable)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_172;
    }
  }
  else if ((v21 & 0x1000) != 0)
  {
    goto LABEL_172;
  }
  collaborationIdentifier = self->_collaborationIdentifier;
  if ((unint64_t)collaborationIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](collaborationIdentifier, "isEqual:")) {
      goto LABEL_172;
    }
    $91AFCFBBFCC236A698A91430C8570A63 v16 = self->_has;
  }
  int v23 = *((_DWORD *)v4 + 32);
  if ((*(_DWORD *)&v16 & 0x10000) != 0)
  {
    if ((v23 & 0x10000) == 0) {
      goto LABEL_172;
    }
    if (self->_supportsLeaveContext)
    {
      if (!*((unsigned char *)v4 + 124)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 124))
    {
      goto LABEL_172;
    }
  }
  else if ((v23 & 0x10000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&v16 & 0x4000) != 0)
  {
    if ((v23 & 0x4000) == 0) {
      goto LABEL_172;
    }
    if (self->_isUPlusOneScreenSharingAvailable)
    {
      if (!*((unsigned char *)v4 + 122)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 122))
    {
      goto LABEL_172;
    }
  }
  else if ((v23 & 0x4000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&v16 & 0x800) != 0)
  {
    if ((v23 & 0x800) == 0) {
      goto LABEL_172;
    }
    if (self->_isSpatialPersonaEnabled)
    {
      if (!*((unsigned char *)v4 + 119)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 119))
    {
      goto LABEL_172;
    }
  }
  else if ((v23 & 0x800) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&v16 & 0x2000) != 0)
  {
    if ((v23 & 0x2000) == 0) {
      goto LABEL_172;
    }
    if (self->_isUPlusOneAVLessAvailable)
    {
      if (!*((unsigned char *)v4 + 121)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 121))
    {
      goto LABEL_172;
    }
  }
  else if ((v23 & 0x2000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(unsigned char *)&v16 & 8) != 0)
  {
    if ((v23 & 8) == 0 || self->_visionFeatureVersion != *((_DWORD *)v4 + 27)) {
      goto LABEL_172;
    }
  }
  else if ((v23 & 8) != 0)
  {
    goto LABEL_172;
  }
  if ((*(unsigned char *)&v16 & 4) != 0)
  {
    if ((v23 & 4) == 0 || self->_visionCallEstablishmentVersion != *((_DWORD *)v4 + 26)) {
      goto LABEL_172;
    }
  }
  else if ((v23 & 4) != 0)
  {
    goto LABEL_172;
  }
  screenSharingRequest = self->_screenSharingRequest;
  if ((unint64_t)screenSharingRequest | *((void *)v4 + 11))
  {
    if (!-[CSDMessagingScreenShareContext isEqual:](screenSharingRequest, "isEqual:")) {
      goto LABEL_172;
    }
    $91AFCFBBFCC236A698A91430C8570A63 v16 = self->_has;
  }
  int v25 = *((_DWORD *)v4 + 32);
  if ((*(_WORD *)&v16 & 0x8000) != 0)
  {
    if ((v25 & 0x8000) == 0) {
      goto LABEL_172;
    }
    if (self->_isUPlusOneVisionToVisionAvailable)
    {
      if (!*((unsigned char *)v4 + 123)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 123))
    {
      goto LABEL_172;
    }
  }
  else if ((v25 & 0x8000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    if ((v25 & 0x20000) == 0) {
      goto LABEL_172;
    }
    if (self->_supportsRequestToScreenShare)
    {
      if (!*((unsigned char *)v4 + 125)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 125))
    {
      goto LABEL_172;
    }
  }
  else if ((v25 & 0x20000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    if ((v25 & 0x200) != 0)
    {
      if (self->_isPhotosSharePlayAvailable)
      {
        if (!*((unsigned char *)v4 + 117)) {
          goto LABEL_172;
        }
      }
      else if (*((unsigned char *)v4 + 117))
      {
        goto LABEL_172;
      }
      BOOL v26 = 1;
      goto LABEL_173;
    }
LABEL_172:
    BOOL v26 = 0;
    goto LABEL_173;
  }
  BOOL v26 = (*((_DWORD *)v4 + 32) & 0x200) == 0;
LABEL_173:

  return v26;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v38 = 2654435761 * self->_version;
  }
  else {
    uint64_t v38 = 0;
  }
  unint64_t v37 = (unint64_t)[(NSMutableArray *)self->_members hash];
  unint64_t v36 = [(CSDMessagingConversationMessage *)self->_message hash];
  NSUInteger v35 = [(NSString *)self->_messagesGroupUUIDString hash];
  NSUInteger v34 = [(NSString *)self->_messagesGroupName hash];
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    uint64_t v33 = 2654435761 * self->_isMomentsAvailable;
  }
  else {
    uint64_t v33 = 0;
  }
  unint64_t v32 = [(CSDMessagingConversationActivitySession *)self->_activitySession hash];
  $91AFCFBBFCC236A698A91430C8570A63 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    uint64_t v31 = 2654435761 * self->_video;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_9:
      uint64_t v30 = 2654435761 * self->_isScreenSharingAvailable;
      goto LABEL_12;
    }
  }
  uint64_t v30 = 0;
LABEL_12:
  NSUInteger v29 = [(NSString *)self->_providerIdentifier hash];
  unint64_t v28 = (unint64_t)[(NSMutableArray *)self->_otherInvitedHandles hash];
  if (*((unsigned char *)&self->_has + 1)) {
    uint64_t v27 = 2654435761 * self->_isPersonaAvailable;
  }
  else {
    uint64_t v27 = 0;
  }
  unint64_t v26 = (unint64_t)[(NSMutableArray *)self->_lightweightMembers hash];
  $91AFCFBBFCC236A698A91430C8570A63 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
    uint64_t v25 = 2654435761 * self->_isLightweight;
    if ((*(unsigned char *)&v4 & 0x20) != 0)
    {
LABEL_17:
      uint64_t v24 = 2654435761 * self->_isGondolaCallingAvailable;
      if ((*(_DWORD *)&v4 & 0x80000) != 0) {
        goto LABEL_18;
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_17;
    }
  }
  uint64_t v24 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_18:
    uint64_t v23 = 2654435761 * self->_videoEnabled;
    if (*(unsigned char *)&v4) {
      goto LABEL_19;
    }
LABEL_24:
    uint64_t v22 = 0;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_20;
    }
    goto LABEL_25;
  }
LABEL_23:
  uint64_t v23 = 0;
  if ((*(unsigned char *)&v4 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  uint64_t v22 = 2654435761 * self->_sharePlayProtocolVersion;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
LABEL_20:
    uint64_t v21 = 2654435761 * self->_isGFTDowngradeToOneToOneAvailable;
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v21 = 0;
LABEL_26:
  unint64_t v20 = [(CSDMessagingConversationParticipantAssociation *)self->_participantAssociation hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    uint64_t v19 = 2654435761 * self->_isUPlusNDowngradeAvailable;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_collaborationIdentifier hash];
  $91AFCFBBFCC236A698A91430C8570A63 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
  {
    uint64_t v7 = 2654435761 * self->_supportsLeaveContext;
    if ((*(_WORD *)&v6 & 0x4000) != 0)
    {
LABEL_31:
      uint64_t v8 = 2654435761 * self->_isUPlusOneScreenSharingAvailable;
      if ((*(_WORD *)&v6 & 0x800) != 0) {
        goto LABEL_32;
      }
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(_WORD *)&v6 & 0x4000) != 0) {
      goto LABEL_31;
    }
  }
  uint64_t v8 = 0;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_32:
    uint64_t v9 = 2654435761 * self->_isSpatialPersonaEnabled;
    if ((*(_WORD *)&v6 & 0x2000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v9 = 0;
  if ((*(_WORD *)&v6 & 0x2000) != 0)
  {
LABEL_33:
    uint64_t v10 = 2654435761 * self->_isUPlusOneAVLessAvailable;
    if ((*(unsigned char *)&v6 & 8) != 0) {
      goto LABEL_34;
    }
LABEL_40:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&v6 & 4) != 0) {
      goto LABEL_35;
    }
    goto LABEL_41;
  }
LABEL_39:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&v6 & 8) == 0) {
    goto LABEL_40;
  }
LABEL_34:
  uint64_t v11 = 2654435761 * self->_visionFeatureVersion;
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
LABEL_35:
    uint64_t v12 = 2654435761 * self->_visionCallEstablishmentVersion;
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v12 = 0;
LABEL_42:
  unint64_t v13 = [(CSDMessagingScreenShareContext *)self->_screenSharingRequest hash];
  $91AFCFBBFCC236A698A91430C8570A63 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
    uint64_t v15 = 0;
    if ((*(_DWORD *)&v14 & 0x20000) != 0) {
      goto LABEL_44;
    }
LABEL_47:
    uint64_t v16 = 0;
    if ((*(_WORD *)&v14 & 0x200) != 0) {
      goto LABEL_45;
    }
LABEL_48:
    uint64_t v17 = 0;
    return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17;
  }
  uint64_t v15 = 2654435761 * self->_isUPlusOneVisionToVisionAvailable;
  if ((*(_DWORD *)&v14 & 0x20000) == 0) {
    goto LABEL_47;
  }
LABEL_44:
  uint64_t v16 = 2654435761 * self->_supportsRequestToScreenShare;
  if ((*(_WORD *)&v14 & 0x200) == 0) {
    goto LABEL_48;
  }
LABEL_45:
  uint64_t v17 = 2654435761 * self->_isPhotosSharePlayAvailable;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 128) & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 25);
    *(_DWORD *)&self->_has |= 2u;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = *((id *)v4 + 4);
  id v7 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CSDMessagingConversationParticipantDidJoinContext *)self addMembers:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v8);
  }

  message = self->_message;
  uint64_t v12 = *((void *)v5 + 5);
  if (message)
  {
    if (v12) {
      -[CSDMessagingConversationMessage mergeFrom:](message, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[CSDMessagingConversationParticipantDidJoinContext setMessage:](self, "setMessage:");
  }
  if (*((void *)v5 + 7)) {
    -[CSDMessagingConversationParticipantDidJoinContext setMessagesGroupUUIDString:](self, "setMessagesGroupUUIDString:");
  }
  if (*((void *)v5 + 6)) {
    -[CSDMessagingConversationParticipantDidJoinContext setMessagesGroupName:](self, "setMessagesGroupName:");
  }
  if ((*((unsigned char *)v5 + 128) & 0x80) != 0)
  {
    self->_isMomentsAvailable = *((unsigned char *)v5 + 115);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  activitySession = self->_activitySession;
  uint64_t v14 = *((void *)v5 + 1);
  if (activitySession)
  {
    if (v14) {
      -[CSDMessagingConversationActivitySession mergeFrom:](activitySession, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[CSDMessagingConversationParticipantDidJoinContext setActivitySession:](self, "setActivitySession:");
  }
  int v15 = *((_DWORD *)v5 + 32);
  if ((v15 & 0x40000) != 0)
  {
    self->_video = *((unsigned char *)v5 + 126);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v15 = *((_DWORD *)v5 + 32);
  }
  if ((v15 & 0x400) != 0)
  {
    self->_isScreenSharingAvailable = *((unsigned char *)v5 + 118);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((void *)v5 + 10)) {
    -[CSDMessagingConversationParticipantDidJoinContext setProviderIdentifier:](self, "setProviderIdentifier:");
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = *((id *)v5 + 8);
  id v17 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v18; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        [(CSDMessagingConversationParticipantDidJoinContext *)self addOtherInvitedHandles:*(void *)(*((void *)&v37 + 1) + 8 * (void)j)];
      }
      id v18 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v18);
  }

  if (*((unsigned char *)v5 + 129))
  {
    self->_isPersonaAvailable = *((unsigned char *)v5 + 116);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = *((id *)v5 + 3);
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v23; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        -[CSDMessagingConversationParticipantDidJoinContext addLightweightMembers:](self, "addLightweightMembers:", *(void *)(*((void *)&v33 + 1) + 8 * (void)k), (void)v33);
      }
      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v23);
  }

  int v26 = *((_DWORD *)v5 + 32);
  if ((v26 & 0x40) != 0)
  {
    self->_isLightweight = *((unsigned char *)v5 + 114);
    *(_DWORD *)&self->_has |= 0x40u;
    int v26 = *((_DWORD *)v5 + 32);
    if ((v26 & 0x20) == 0)
    {
LABEL_50:
      if ((v26 & 0x80000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_59;
    }
  }
  else if ((v26 & 0x20) == 0)
  {
    goto LABEL_50;
  }
  self->_isGondolaCallingAvailable = *((unsigned char *)v5 + 113);
  *(_DWORD *)&self->_has |= 0x20u;
  int v26 = *((_DWORD *)v5 + 32);
  if ((v26 & 0x80000) == 0)
  {
LABEL_51:
    if ((v26 & 1) == 0) {
      goto LABEL_52;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_videoEnabled = *((unsigned char *)v5 + 127);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v26 = *((_DWORD *)v5 + 32);
  if ((v26 & 1) == 0)
  {
LABEL_52:
    if ((v26 & 0x10) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_60:
  self->_sharePlayProtocolVersion = *((_DWORD *)v5 + 24);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)v5 + 32) & 0x10) != 0)
  {
LABEL_53:
    self->_isGFTDowngradeToOneToOneAvailable = *((unsigned char *)v5 + 112);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_54:
  participantAssociation = self->_participantAssociation;
  uint64_t v28 = *((void *)v5 + 9);
  if (participantAssociation)
  {
    if (v28) {
      -[CSDMessagingConversationParticipantAssociation mergeFrom:](participantAssociation, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[CSDMessagingConversationParticipantDidJoinContext setParticipantAssociation:](self, "setParticipantAssociation:");
  }
  if ((*((unsigned char *)v5 + 129) & 0x10) != 0)
  {
    self->_isUPlusNDowngradeAvailable = *((unsigned char *)v5 + 120);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((void *)v5 + 2)) {
    -[CSDMessagingConversationParticipantDidJoinContext setCollaborationIdentifier:](self, "setCollaborationIdentifier:");
  }
  int v29 = *((_DWORD *)v5 + 32);
  if ((v29 & 0x10000) != 0)
  {
    self->_supportsLeaveContext = *((unsigned char *)v5 + 124);
    *(_DWORD *)&self->_has |= 0x10000u;
    int v29 = *((_DWORD *)v5 + 32);
    if ((v29 & 0x4000) == 0)
    {
LABEL_70:
      if ((v29 & 0x800) == 0) {
        goto LABEL_71;
      }
      goto LABEL_80;
    }
  }
  else if ((v29 & 0x4000) == 0)
  {
    goto LABEL_70;
  }
  self->_isUPlusOneScreenSharingAvailable = *((unsigned char *)v5 + 122);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v29 = *((_DWORD *)v5 + 32);
  if ((v29 & 0x800) == 0)
  {
LABEL_71:
    if ((v29 & 0x2000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_isSpatialPersonaEnabled = *((unsigned char *)v5 + 119);
  *(_DWORD *)&self->_has |= 0x800u;
  int v29 = *((_DWORD *)v5 + 32);
  if ((v29 & 0x2000) == 0)
  {
LABEL_72:
    if ((v29 & 8) == 0) {
      goto LABEL_73;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_isUPlusOneAVLessAvailable = *((unsigned char *)v5 + 121);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v29 = *((_DWORD *)v5 + 32);
  if ((v29 & 8) == 0)
  {
LABEL_73:
    if ((v29 & 4) == 0) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
LABEL_82:
  self->_visionFeatureVersion = *((_DWORD *)v5 + 27);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)v5 + 32) & 4) != 0)
  {
LABEL_74:
    self->_visionCallEstablishmentVersion = *((_DWORD *)v5 + 26);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_75:
  screenSharingRequest = self->_screenSharingRequest;
  uint64_t v31 = *((void *)v5 + 11);
  if (screenSharingRequest)
  {
    if (v31) {
      -[CSDMessagingScreenShareContext mergeFrom:](screenSharingRequest, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[CSDMessagingConversationParticipantDidJoinContext setScreenSharingRequest:](self, "setScreenSharingRequest:");
  }
  int v32 = *((_DWORD *)v5 + 32);
  if ((v32 & 0x8000) == 0)
  {
    if ((v32 & 0x20000) == 0) {
      goto LABEL_88;
    }
LABEL_92:
    self->_supportsRequestToScreenShare = *((unsigned char *)v5 + 125);
    *(_DWORD *)&self->_has |= 0x20000u;
    if ((*((_DWORD *)v5 + 32) & 0x200) == 0) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }
  self->_isUPlusOneVisionToVisionAvailable = *((unsigned char *)v5 + 123);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v32 = *((_DWORD *)v5 + 32);
  if ((v32 & 0x20000) != 0) {
    goto LABEL_92;
  }
LABEL_88:
  if ((v32 & 0x200) != 0)
  {
LABEL_89:
    self->_isPhotosSharePlayAvailable = *((unsigned char *)v5 + 117);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_90:
}

- (unsigned)version
{
  return self->_version;
}

- (NSMutableArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
}

- (CSDMessagingConversationMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)messagesGroupUUIDString
{
  return self->_messagesGroupUUIDString;
}

- (void)setMessagesGroupUUIDString:(id)a3
{
}

- (NSString)messagesGroupName
{
  return self->_messagesGroupName;
}

- (void)setMessagesGroupName:(id)a3
{
}

- (BOOL)isMomentsAvailable
{
  return self->_isMomentsAvailable;
}

- (CSDMessagingConversationActivitySession)activitySession
{
  return self->_activitySession;
}

- (void)setActivitySession:(id)a3
{
}

- (BOOL)video
{
  return self->_video;
}

- (BOOL)isScreenSharingAvailable
{
  return self->_isScreenSharingAvailable;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (NSMutableArray)otherInvitedHandles
{
  return self->_otherInvitedHandles;
}

- (void)setOtherInvitedHandles:(id)a3
{
}

- (BOOL)isPersonaAvailable
{
  return self->_isPersonaAvailable;
}

- (NSMutableArray)lightweightMembers
{
  return self->_lightweightMembers;
}

- (void)setLightweightMembers:(id)a3
{
}

- (BOOL)isLightweight
{
  return self->_isLightweight;
}

- (BOOL)isGondolaCallingAvailable
{
  return self->_isGondolaCallingAvailable;
}

- (BOOL)videoEnabled
{
  return self->_videoEnabled;
}

- (unsigned)sharePlayProtocolVersion
{
  return self->_sharePlayProtocolVersion;
}

- (BOOL)isGFTDowngradeToOneToOneAvailable
{
  return self->_isGFTDowngradeToOneToOneAvailable;
}

- (CSDMessagingConversationParticipantAssociation)participantAssociation
{
  return self->_participantAssociation;
}

- (void)setParticipantAssociation:(id)a3
{
}

- (BOOL)isUPlusNDowngradeAvailable
{
  return self->_isUPlusNDowngradeAvailable;
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (void)setCollaborationIdentifier:(id)a3
{
}

- (BOOL)supportsLeaveContext
{
  return self->_supportsLeaveContext;
}

- (BOOL)isUPlusOneScreenSharingAvailable
{
  return self->_isUPlusOneScreenSharingAvailable;
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_isSpatialPersonaEnabled;
}

- (BOOL)isUPlusOneAVLessAvailable
{
  return self->_isUPlusOneAVLessAvailable;
}

- (unsigned)visionFeatureVersion
{
  return self->_visionFeatureVersion;
}

- (unsigned)visionCallEstablishmentVersion
{
  return self->_visionCallEstablishmentVersion;
}

- (CSDMessagingScreenShareContext)screenSharingRequest
{
  return self->_screenSharingRequest;
}

- (void)setScreenSharingRequest:(id)a3
{
}

- (BOOL)isUPlusOneVisionToVisionAvailable
{
  return self->_isUPlusOneVisionToVisionAvailable;
}

- (BOOL)supportsRequestToScreenShare
{
  return self->_supportsRequestToScreenShare;
}

- (BOOL)isPhotosSharePlayAvailable
{
  return self->_isPhotosSharePlayAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenSharingRequest, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_participantAssociation, 0);
  objc_storeStrong((id *)&self->_otherInvitedHandles, 0);
  objc_storeStrong((id *)&self->_messagesGroupUUIDString, 0);
  objc_storeStrong((id *)&self->_messagesGroupName, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_lightweightMembers, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);

  objc_storeStrong((id *)&self->_activitySession, 0);
}

- (id)allTUConversationMembers
{
  int v3 = [(CSDMessagingConversationParticipantDidJoinContext *)self members];
  id v4 = (char *)[v3 count];
  id v5 = [(CSDMessagingConversationParticipantDidJoinContext *)self lightweightMembers];
  id v6 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", &v4[(void)[v5 count]]);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [(CSDMessagingConversationParticipantDidJoinContext *)self members];
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) tuConversationMember];
        if (v12) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v13 = [(CSDMessagingConversationParticipantDidJoinContext *)self lightweightMembers];
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) tuConversationMember];
        if (v18) {
          [v6 addObject:v18];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  id v19 = [v6 copy];

  return v19;
}

- (NSSet)tuConversationMembers
{
  int v3 = [(CSDMessagingConversationParticipantDidJoinContext *)self members];
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  id v5 = [(CSDMessagingConversationParticipantDidJoinContext *)self allTUConversationMembers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v10 isLightweightMember] & 1) == 0) {
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

- (void)setTuConversationMembers:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unsigned int v10 = [v9 isLightweightMember];
        id v11 = +[CSDMessagingConversationMember memberWithTUConversationMember:v9];
        if (v10) {
          [(CSDMessagingConversationParticipantDidJoinContext *)self addLightweightMembers:v11];
        }
        else {
          [(CSDMessagingConversationParticipantDidJoinContext *)self addMembers:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (NSSet)otherInvitedTUHandles
{
  int v3 = [(CSDMessagingConversationParticipantDidJoinContext *)self otherInvitedHandles];
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CSDMessagingConversationParticipantDidJoinContext *)self otherInvitedHandles];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) tuHandle];
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

- (void)setOtherInvitedTUHandles:(id)a3
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
        id v9 = +[CSDMessagingHandle handleWithTUHandle:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        [(CSDMessagingConversationParticipantDidJoinContext *)self addOtherInvitedHandles:v9];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSSet)tuLightweightMembers
{
  int v3 = [(CSDMessagingConversationParticipantDidJoinContext *)self lightweightMembers];
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  id v5 = [(CSDMessagingConversationParticipantDidJoinContext *)self allTUConversationMembers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 isLightweightMember]) {
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

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CSDMessagingConversationParticipantDidJoinContext;
  int v3 = [(CSDMessagingConversationParticipantDidJoinContext *)&v8 description];
  id v4 = [(CSDMessagingConversationParticipantDidJoinContext *)self dictionaryRepresentation];
  id v5 = TULoggableStringForObject();
  id v6 = +[NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

@end