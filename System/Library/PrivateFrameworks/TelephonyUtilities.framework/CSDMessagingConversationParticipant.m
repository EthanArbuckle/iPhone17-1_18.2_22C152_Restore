@interface CSDMessagingConversationParticipant
+ (id)participantWithCSDConversationJoinContext:(id)a3;
+ (id)participantWithCSDConversationParticipant:(id)a3;
+ (id)participantWithTUConversationParticipant:(id)a3;
- (BOOL)guestModeEnabled;
- (BOOL)hasAssociation;
- (BOOL)hasAvMode;
- (BOOL)hasAvcData;
- (BOOL)hasGuestModeEnabled;
- (BOOL)hasHandle;
- (BOOL)hasIdentifier;
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
- (BOOL)hasOptions;
- (BOOL)hasPersonaHandshakeData;
- (BOOL)hasPresentationMode;
- (BOOL)hasSharePlayProtocolVersion;
- (BOOL)hasSpatialPersonaGenerationCounter;
- (BOOL)hasSupportsLeaveContext;
- (BOOL)hasSupportsRequestToScreenShare;
- (BOOL)hasVersion;
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
- (CSDConversationParticipant)csdConversationParticipant;
- (CSDMessagingConversationParticipantAssociation)association;
- (CSDMessagingHandle)handle;
- (NSData)avcData;
- (NSData)personaHandshakeData;
- (id)avModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)presentationModeAsString:(int)a3;
- (int)StringAsAvMode:(id)a3;
- (int)StringAsPresentationMode:(id)a3;
- (int)avMode;
- (int)presentationMode;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)resolvedPresentationMode;
- (unsigned)options;
- (unsigned)sharePlayProtocolVersion;
- (unsigned)spatialPersonaGenerationCounter;
- (unsigned)version;
- (unsigned)visionCallEstablishmentVersion;
- (unsigned)visionFeatureVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociation:(id)a3;
- (void)setAvMode:(int)a3;
- (void)setAvcData:(id)a3;
- (void)setGuestModeEnabled:(BOOL)a3;
- (void)setHandle:(id)a3;
- (void)setHasAvMode:(BOOL)a3;
- (void)setHasGuestModeEnabled:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
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
- (void)setHasOptions:(BOOL)a3;
- (void)setHasPresentationMode:(BOOL)a3;
- (void)setHasSharePlayProtocolVersion:(BOOL)a3;
- (void)setHasSpatialPersonaGenerationCounter:(BOOL)a3;
- (void)setHasSupportsLeaveContext:(BOOL)a3;
- (void)setHasSupportsRequestToScreenShare:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasVisionCallEstablishmentVersion:(BOOL)a3;
- (void)setHasVisionFeatureVersion:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
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
- (void)setOptions:(unsigned int)a3;
- (void)setPersonaHandshakeData:(id)a3;
- (void)setPresentationMode:(int)a3;
- (void)setSharePlayProtocolVersion:(unsigned int)a3;
- (void)setSpatialPersonaGenerationCounter:(unsigned int)a3;
- (void)setSupportsLeaveContext:(BOOL)a3;
- (void)setSupportsRequestToScreenShare:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setVisionCallEstablishmentVersion:(unsigned int)a3;
- (void)setVisionFeatureVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationParticipant

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIdentifier:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasIdentifier
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasAvcData
{
  return self->_avcData != 0;
}

- (void)setIsMomentsAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isMomentsAvailable = a3;
}

- (void)setHasIsMomentsAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsMomentsAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsScreenSharingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isScreenSharingAvailable = a3;
}

- (void)setHasIsScreenSharingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsScreenSharingAvailable
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsGondolaCallingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isGondolaCallingAvailable = a3;
}

- (void)setHasIsGondolaCallingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsGondolaCallingAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsPersonaAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isPersonaAvailable = a3;
}

- (void)setHasIsPersonaAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsPersonaAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsLightweight:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isLightweight = a3;
}

- (void)setHasIsLightweight:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsLightweight
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSharePlayProtocolVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_sharePlayProtocolVersion = a3;
}

- (void)setHasSharePlayProtocolVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasSharePlayProtocolVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setOptions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_options = a3;
}

- (void)setHasOptions:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasOptions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsGFTDowngradeToOneToOneAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_isGFTDowngradeToOneToOneAvailable = a3;
}

- (void)setHasIsGFTDowngradeToOneToOneAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIsGFTDowngradeToOneToOneAvailable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setGuestModeEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_guestModeEnabled = a3;
}

- (void)setHasGuestModeEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasGuestModeEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasAssociation
{
  return self->_association != 0;
}

- (void)setIsUPlusNDowngradeAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isUPlusNDowngradeAvailable = a3;
}

- (void)setHasIsUPlusNDowngradeAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsUPlusNDowngradeAvailable
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)avMode
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_avMode;
  }
  else {
    return 0;
  }
}

- (void)setAvMode:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_avMode = a3;
}

- (void)setHasAvMode:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAvMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)avModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_1005050F0 + a3);
  }

  return v3;
}

- (int)StringAsAvMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Audio"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSupportsLeaveContext:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_supportsLeaveContext = a3;
}

- (void)setHasSupportsLeaveContext:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSupportsLeaveContext
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsUPlusOneScreenSharingAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isUPlusOneScreenSharingAvailable = a3;
}

- (void)setHasIsUPlusOneScreenSharingAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsUPlusOneScreenSharingAvailable
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasPersonaHandshakeData
{
  return self->_personaHandshakeData != 0;
}

- (void)setIsSpatialPersonaEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isSpatialPersonaEnabled = a3;
}

- (void)setHasIsSpatialPersonaEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsSpatialPersonaEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsUPlusOneAVLessAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isUPlusOneAVLessAvailable = a3;
}

- (void)setHasIsUPlusOneAVLessAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsUPlusOneAVLessAvailable
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setVisionFeatureVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_visionFeatureVersion = a3;
}

- (void)setHasVisionFeatureVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasVisionFeatureVersion
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setVisionCallEstablishmentVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_visionCallEstablishmentVersion = a3;
}

- (void)setHasVisionCallEstablishmentVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasVisionCallEstablishmentVersion
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setIsUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isUPlusOneVisionToVisionAvailable = a3;
}

- (void)setHasIsUPlusOneVisionToVisionAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsUPlusOneVisionToVisionAvailable
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSupportsRequestToScreenShare:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_supportsRequestToScreenShare = a3;
}

- (void)setHasSupportsRequestToScreenShare:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSupportsRequestToScreenShare
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSpatialPersonaGenerationCounter:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_spatialPersonaGenerationCounter = a3;
}

- (void)setHasSpatialPersonaGenerationCounter:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasSpatialPersonaGenerationCounter
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsPhotosSharePlayAvailable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isPhotosSharePlayAvailable = a3;
}

- (void)setHasIsPhotosSharePlayAvailable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsPhotosSharePlayAvailable
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (int)presentationMode
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_presentationMode;
  }
  else {
    return 0;
  }
}

- (void)setPresentationMode:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_presentationMode = a3;
}

- (void)setHasPresentationMode:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F38001990BA1E94C86B335DE43A22703)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPresentationMode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)presentationModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100505108 + a3);
  }

  return v3;
}

- (int)StringAsPresentationMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AVLessSharePlay"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ContinuitySession"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  }
  if (*(unsigned char *)&has)
  {
    v6 = +[NSNumber numberWithUnsignedLongLong:self->_identifier];
    [v3 setObject:v6 forKey:@"identifier"];
  }
  handle = self->_handle;
  if (handle)
  {
    v8 = [(CSDMessagingHandle *)handle dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"handle"];
  }
  avcData = self->_avcData;
  if (avcData) {
    [v3 setObject:avcData forKey:@"avcData"];
  }
  $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    v18 = +[NSNumber numberWithBool:self->_isMomentsAvailable];
    [v3 setObject:v18 forKey:@"isMomentsAvailable"];

    $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x10000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v10 & 0x800) == 0) {
        goto LABEL_12;
      }
      goto LABEL_40;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
    goto LABEL_11;
  }
  v19 = +[NSNumber numberWithBool:self->_isScreenSharingAvailable];
  [v3 setObject:v19 forKey:@"isScreenSharingAvailable"];

  $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v10 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  v20 = +[NSNumber numberWithBool:self->_isGondolaCallingAvailable];
  [v3 setObject:v20 forKey:@"isGondolaCallingAvailable"];

  $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v10 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  v21 = +[NSNumber numberWithBool:self->_isPersonaAvailable];
  [v3 setObject:v21 forKey:@"isPersonaAvailable"];

  $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v10 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  v22 = +[NSNumber numberWithBool:self->_isLightweight];
  [v3 setObject:v22 forKey:@"isLightweight"];

  $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x10) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v10 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  v23 = +[NSNumber numberWithUnsignedInt:self->_sharePlayProtocolVersion];
  [v3 setObject:v23 forKey:@"sharePlayProtocolVersion"];

  $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 4) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v10 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  v24 = +[NSNumber numberWithUnsignedInt:self->_options];
  [v3 setObject:v24 forKey:@"options"];

  $F38001990BA1E94C86B335DE43A22703 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v10 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_45:
  v25 = +[NSNumber numberWithBool:self->_isGFTDowngradeToOneToOneAvailable];
  [v3 setObject:v25 forKey:@"isGFTDowngradeToOneToOneAvailable"];

  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_18:
    v11 = +[NSNumber numberWithBool:self->_guestModeEnabled];
    [v3 setObject:v11 forKey:@"guestModeEnabled"];
  }
LABEL_19:
  association = self->_association;
  if (association)
  {
    v13 = [(CSDMessagingConversationParticipantAssociation *)association dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"association"];
  }
  $F38001990BA1E94C86B335DE43A22703 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    v26 = +[NSNumber numberWithBool:self->_isUPlusNDowngradeAvailable];
    [v3 setObject:v26 forKey:@"isUPlusNDowngradeAvailable"];

    $F38001990BA1E94C86B335DE43A22703 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 2) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v14 & 0x400000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_62;
    }
  }
  else if ((*(unsigned char *)&v14 & 2) == 0)
  {
    goto LABEL_23;
  }
  uint64_t avMode = self->_avMode;
  if (avMode >= 3)
  {
    v28 = +[NSString stringWithFormat:@"(unknown: %i)", self->_avMode];
  }
  else
  {
    v28 = *(&off_1005050F0 + avMode);
  }
  [v3 setObject:v28 forKey:@"avMode"];

  $F38001990BA1E94C86B335DE43A22703 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v14 & 0x100000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_62:
  v39 = +[NSNumber numberWithBool:self->_supportsLeaveContext];
  [v3 setObject:v39 forKey:@"supportsLeaveContext"];

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_25:
    v15 = +[NSNumber numberWithBool:self->_isUPlusOneScreenSharingAvailable];
    [v3 setObject:v15 forKey:@"isUPlusOneScreenSharingAvailable"];
  }
LABEL_26:
  personaHandshakeData = self->_personaHandshakeData;
  if (personaHandshakeData) {
    [v3 setObject:personaHandshakeData forKey:@"personaHandshakeData"];
  }
  $F38001990BA1E94C86B335DE43A22703 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    v29 = +[NSNumber numberWithBool:self->_isSpatialPersonaEnabled];
    [v3 setObject:v29 forKey:@"isSpatialPersonaEnabled"];

    $F38001990BA1E94C86B335DE43A22703 v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x80000) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&v17 & 0x100) == 0) {
        goto LABEL_31;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x80000) == 0)
  {
    goto LABEL_30;
  }
  v30 = +[NSNumber numberWithBool:self->_isUPlusOneAVLessAvailable];
  [v3 setObject:v30 forKey:@"isUPlusOneAVLessAvailable"];

  $F38001990BA1E94C86B335DE43A22703 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x100) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v17 & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_53;
  }
LABEL_52:
  v31 = +[NSNumber numberWithUnsignedInt:self->_visionFeatureVersion];
  [v3 setObject:v31 forKey:@"visionFeatureVersion"];

  $F38001990BA1E94C86B335DE43A22703 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 0x80) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v17 & 0x200000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_54;
  }
LABEL_53:
  v32 = +[NSNumber numberWithUnsignedInt:self->_visionCallEstablishmentVersion];
  [v3 setObject:v32 forKey:@"visionCallEstablishmentVersion"];

  $F38001990BA1E94C86B335DE43A22703 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x200000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v17 & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_55;
  }
LABEL_54:
  v33 = +[NSNumber numberWithBool:self->_isUPlusOneVisionToVisionAvailable];
  [v3 setObject:v33 forKey:@"isUPlusOneVisionToVisionAvailable"];

  $F38001990BA1E94C86B335DE43A22703 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x800000) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v17 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_56;
  }
LABEL_55:
  v34 = +[NSNumber numberWithBool:self->_supportsRequestToScreenShare];
  [v3 setObject:v34 forKey:@"supportsRequestToScreenShare"];

  $F38001990BA1E94C86B335DE43A22703 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 0x20) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v17 & 0x8000) == 0) {
      goto LABEL_36;
    }
LABEL_57:
    v36 = +[NSNumber numberWithBool:self->_isPhotosSharePlayAvailable];
    [v3 setObject:v36 forKey:@"isPhotosSharePlayAvailable"];

    if ((*(_DWORD *)&self->_has & 8) == 0) {
      goto LABEL_66;
    }
LABEL_58:
    uint64_t presentationMode = self->_presentationMode;
    if (presentationMode >= 3)
    {
      v38 = +[NSString stringWithFormat:@"(unknown: %i)", self->_presentationMode];
    }
    else
    {
      v38 = *(&off_100505108 + presentationMode);
    }
    [v3 setObject:v38 forKey:@"presentationMode"];

    goto LABEL_66;
  }
LABEL_56:
  v35 = +[NSNumber numberWithUnsignedInt:self->_spatialPersonaGenerationCounter];
  [v3 setObject:v35 forKey:@"spatialPersonaGenerationCounter"];

  $F38001990BA1E94C86B335DE43A22703 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x8000) != 0) {
    goto LABEL_57;
  }
LABEL_36:
  if ((*(unsigned char *)&v17 & 8) != 0) {
    goto LABEL_58;
  }
LABEL_66:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001A534((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  }
  if (*(unsigned char *)&has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_handle) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avcData) {
    PBDataWriterWriteDataField();
  }
  $F38001990BA1E94C86B335DE43A22703 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F38001990BA1E94C86B335DE43A22703 v5 = self->_has;
    if ((*(_DWORD *)&v5 & 0x10000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v5 & 0x800) == 0) {
        goto LABEL_12;
      }
      goto LABEL_43;
    }
  }
  else if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  $F38001990BA1E94C86B335DE43A22703 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  $F38001990BA1E94C86B335DE43A22703 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v5 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  $F38001990BA1E94C86B335DE43A22703 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v5 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  $F38001990BA1E94C86B335DE43A22703 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x10) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v5 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $F38001990BA1E94C86B335DE43A22703 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 4) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v5 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $F38001990BA1E94C86B335DE43A22703 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v5 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x200) != 0) {
LABEL_18:
  }
    PBDataWriterWriteBOOLField();
LABEL_19:
  if (self->_association) {
    PBDataWriterWriteSubmessage();
  }
  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v6 & 0x400000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_52;
    }
  }
  else if ((*(unsigned char *)&v6 & 2) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteInt32Field();
  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_25:
  }
    PBDataWriterWriteBOOLField();
LABEL_26:
  if (self->_personaHandshakeData) {
    PBDataWriterWriteDataField();
  }
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&v7 & 0x100) == 0) {
        goto LABEL_31;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
    goto LABEL_30;
  }
  PBDataWriterWriteBOOLField();
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v7 & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v7 & 8) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 8) != 0) {
LABEL_37:
  }
    PBDataWriterWriteInt32Field();
LABEL_38:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    v4[19] = self->_version;
    v4[26] |= 0x40u;
    $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  }
  if (*(unsigned char *)&has)
  {
    *((void *)v4 + 1) = self->_identifier;
    v4[26] |= 1u;
  }
  v9 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    int v4 = v9;
  }
  if (self->_avcData)
  {
    objc_msgSend(v9, "setAvcData:");
    int v4 = v9;
  }
  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) != 0)
  {
    *((unsigned char *)v4 + 92) = self->_isMomentsAvailable;
    v4[26] |= 0x2000u;
    $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v6 & 0x800) == 0) {
        goto LABEL_12;
      }
      goto LABEL_43;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
    goto LABEL_11;
  }
  *((unsigned char *)v4 + 95) = self->_isScreenSharingAvailable;
  v4[26] |= 0x10000u;
  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((unsigned char *)v4 + 90) = self->_isGondolaCallingAvailable;
  v4[26] |= 0x800u;
  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((unsigned char *)v4 + 93) = self->_isPersonaAvailable;
  v4[26] |= 0x4000u;
  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((unsigned char *)v4 + 91) = self->_isLightweight;
  v4[26] |= 0x1000u;
  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  v4[17] = self->_sharePlayProtocolVersion;
  v4[26] |= 0x10u;
  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  v4[12] = self->_options;
  v4[26] |= 4u;
  $F38001990BA1E94C86B335DE43A22703 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_48:
  *((unsigned char *)v4 + 89) = self->_isGFTDowngradeToOneToOneAvailable;
  v4[26] |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_18:
    *((unsigned char *)v4 + 88) = self->_guestModeEnabled;
    v4[26] |= 0x200u;
  }
LABEL_19:
  if (self->_association)
  {
    objc_msgSend(v9, "setAssociation:");
    int v4 = v9;
  }
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) != 0)
  {
    *((unsigned char *)v4 + 97) = self->_isUPlusNDowngradeAvailable;
    v4[26] |= 0x40000u;
    $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 2) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v7 & 0x400000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_52;
    }
  }
  else if ((*(unsigned char *)&v7 & 2) == 0)
  {
    goto LABEL_23;
  }
  v4[6] = self->_avMode;
  v4[26] |= 2u;
  $F38001990BA1E94C86B335DE43A22703 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v7 & 0x100000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_52:
  *((unsigned char *)v4 + 101) = self->_supportsLeaveContext;
  v4[26] |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_25:
    *((unsigned char *)v4 + 99) = self->_isUPlusOneScreenSharingAvailable;
    v4[26] |= 0x100000u;
  }
LABEL_26:
  if (self->_personaHandshakeData)
  {
    objc_msgSend(v9, "setPersonaHandshakeData:");
    int v4 = v9;
  }
  $F38001990BA1E94C86B335DE43A22703 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) != 0)
  {
    *((unsigned char *)v4 + 96) = self->_isSpatialPersonaEnabled;
    v4[26] |= 0x20000u;
    $F38001990BA1E94C86B335DE43A22703 v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x80000) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&v8 & 0x100) == 0) {
        goto LABEL_31;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
    goto LABEL_30;
  }
  *((unsigned char *)v4 + 98) = self->_isUPlusOneAVLessAvailable;
  v4[26] |= 0x80000u;
  $F38001990BA1E94C86B335DE43A22703 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v8 & 0x80) == 0) {
      goto LABEL_32;
    }
    goto LABEL_57;
  }
LABEL_56:
  v4[21] = self->_visionFeatureVersion;
  v4[26] |= 0x100u;
  $F38001990BA1E94C86B335DE43A22703 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x80) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v8 & 0x200000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_58;
  }
LABEL_57:
  v4[20] = self->_visionCallEstablishmentVersion;
  v4[26] |= 0x80u;
  $F38001990BA1E94C86B335DE43A22703 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v8 & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((unsigned char *)v4 + 100) = self->_isUPlusOneVisionToVisionAvailable;
  v4[26] |= 0x200000u;
  $F38001990BA1E94C86B335DE43A22703 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v8 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((unsigned char *)v4 + 102) = self->_supportsRequestToScreenShare;
  v4[26] |= 0x800000u;
  $F38001990BA1E94C86B335DE43A22703 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v8 & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_61;
  }
LABEL_60:
  v4[18] = self->_spatialPersonaGenerationCounter;
  v4[26] |= 0x20u;
  $F38001990BA1E94C86B335DE43A22703 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v8 & 8) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_61:
  *((unsigned char *)v4 + 94) = self->_isPhotosSharePlayAvailable;
  v4[26] |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_37:
    v4[16] = self->_presentationMode;
    v4[26] |= 8u;
  }
LABEL_38:
}

- (id)copyWithZone:(_NSZone *)a3
{
  $F38001990BA1E94C86B335DE43A22703 v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $F38001990BA1E94C86B335DE43A22703 v6 = v5;
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    v5[19] = self->_version;
    v5[26] |= 0x40u;
    $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  }
  if (*(unsigned char *)&has)
  {
    *((void *)v5 + 1) = self->_identifier;
    v5[26] |= 1u;
  }
  id v8 = [(CSDMessagingHandle *)self->_handle copyWithZone:a3];
  v9 = (void *)v6[5];
  v6[5] = v8;

  id v10 = [(NSData *)self->_avcData copyWithZone:a3];
  v11 = (void *)v6[4];
  v6[4] = v10;

  $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    *((unsigned char *)v6 + 92) = self->_isMomentsAvailable;
    *((_DWORD *)v6 + 26) |= 0x2000u;
    $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x10000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&v12 & 0x800) == 0) {
        goto LABEL_8;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v6 + 95) = self->_isScreenSharingAvailable;
  *((_DWORD *)v6 + 26) |= 0x10000u;
  $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&v12 & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((unsigned char *)v6 + 90) = self->_isGondolaCallingAvailable;
  *((_DWORD *)v6 + 26) |= 0x800u;
  $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&v12 & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((unsigned char *)v6 + 93) = self->_isPersonaAvailable;
  *((_DWORD *)v6 + 26) |= 0x4000u;
  $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x1000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v12 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((unsigned char *)v6 + 91) = self->_isLightweight;
  *((_DWORD *)v6 + 26) |= 0x1000u;
  $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x10) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&v12 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v6 + 17) = self->_sharePlayProtocolVersion;
  *((_DWORD *)v6 + 26) |= 0x10u;
  $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 4) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v12 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v6 + 12) = self->_options;
  *((_DWORD *)v6 + 26) |= 4u;
  $F38001990BA1E94C86B335DE43A22703 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v12 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_38:
  *((unsigned char *)v6 + 89) = self->_isGFTDowngradeToOneToOneAvailable;
  *((_DWORD *)v6 + 26) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_14:
    *((unsigned char *)v6 + 88) = self->_guestModeEnabled;
    *((_DWORD *)v6 + 26) |= 0x200u;
  }
LABEL_15:
  id v13 = [(CSDMessagingConversationParticipantAssociation *)self->_association copyWithZone:a3];
  $F38001990BA1E94C86B335DE43A22703 v14 = (void *)v6[2];
  v6[2] = v13;

  $F38001990BA1E94C86B335DE43A22703 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
    *((unsigned char *)v6 + 97) = self->_isUPlusNDowngradeAvailable;
    *((_DWORD *)v6 + 26) |= 0x40000u;
    $F38001990BA1E94C86B335DE43A22703 v15 = self->_has;
    if ((*(unsigned char *)&v15 & 2) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&v15 & 0x400000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&v15 & 2) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v6 + 6) = self->_avMode;
  *((_DWORD *)v6 + 26) |= 2u;
  $F38001990BA1E94C86B335DE43A22703 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v15 & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_42:
  *((unsigned char *)v6 + 101) = self->_supportsLeaveContext;
  *((_DWORD *)v6 + 26) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_19:
    *((unsigned char *)v6 + 99) = self->_isUPlusOneScreenSharingAvailable;
    *((_DWORD *)v6 + 26) |= 0x100000u;
  }
LABEL_20:
  id v16 = [(NSData *)self->_personaHandshakeData copyWithZone:a3];
  $F38001990BA1E94C86B335DE43A22703 v17 = (void *)v6[7];
  v6[7] = v16;

  $F38001990BA1E94C86B335DE43A22703 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000) != 0)
  {
    *((unsigned char *)v6 + 96) = self->_isSpatialPersonaEnabled;
    *((_DWORD *)v6 + 26) |= 0x20000u;
    $F38001990BA1E94C86B335DE43A22703 v18 = self->_has;
    if ((*(_DWORD *)&v18 & 0x80000) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v18 & 0x100) == 0) {
        goto LABEL_23;
      }
      goto LABEL_46;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x80000) == 0)
  {
    goto LABEL_22;
  }
  *((unsigned char *)v6 + 98) = self->_isUPlusOneAVLessAvailable;
  *((_DWORD *)v6 + 26) |= 0x80000u;
  $F38001990BA1E94C86B335DE43A22703 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x100) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v18 & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v6 + 21) = self->_visionFeatureVersion;
  *((_DWORD *)v6 + 26) |= 0x100u;
  $F38001990BA1E94C86B335DE43A22703 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x80) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v18 & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v6 + 20) = self->_visionCallEstablishmentVersion;
  *((_DWORD *)v6 + 26) |= 0x80u;
  $F38001990BA1E94C86B335DE43A22703 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x200000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v18 & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((unsigned char *)v6 + 100) = self->_isUPlusOneVisionToVisionAvailable;
  *((_DWORD *)v6 + 26) |= 0x200000u;
  $F38001990BA1E94C86B335DE43A22703 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x800000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v18 & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((unsigned char *)v6 + 102) = self->_supportsRequestToScreenShare;
  *((_DWORD *)v6 + 26) |= 0x800000u;
  $F38001990BA1E94C86B335DE43A22703 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x20) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v18 & 0x8000) == 0) {
      goto LABEL_28;
    }
LABEL_51:
    *((unsigned char *)v6 + 94) = self->_isPhotosSharePlayAvailable;
    *((_DWORD *)v6 + 26) |= 0x8000u;
    if ((*(_DWORD *)&self->_has & 8) == 0) {
      return v6;
    }
    goto LABEL_29;
  }
LABEL_50:
  *((_DWORD *)v6 + 18) = self->_spatialPersonaGenerationCounter;
  *((_DWORD *)v6 + 26) |= 0x20u;
  $F38001990BA1E94C86B335DE43A22703 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x8000) != 0) {
    goto LABEL_51;
  }
LABEL_28:
  if ((*(unsigned char *)&v18 & 8) != 0)
  {
LABEL_29:
    *((_DWORD *)v6 + 16) = self->_presentationMode;
    *((_DWORD *)v6 + 26) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_177;
  }
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  int v6 = *((_DWORD *)v4 + 26);
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_version != *((_DWORD *)v4 + 19)) {
      goto LABEL_177;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_177;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_identifier != *((void *)v4 + 1)) {
      goto LABEL_177;
    }
  }
  else if (v6)
  {
    goto LABEL_177;
  }
  handle = self->_handle;
  if ((unint64_t)handle | *((void *)v4 + 5) && !-[CSDMessagingHandle isEqual:](handle, "isEqual:")) {
    goto LABEL_177;
  }
  avcData = self->_avcData;
  if ((unint64_t)avcData | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](avcData, "isEqual:")) {
      goto LABEL_177;
    }
  }
  $F38001990BA1E94C86B335DE43A22703 v9 = self->_has;
  int v10 = *((_DWORD *)v4 + 26);
  if ((*(_WORD *)&v9 & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0) {
      goto LABEL_177;
    }
    if (self->_isMomentsAvailable)
    {
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 92))
    {
      goto LABEL_177;
    }
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&v9 & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0) {
      goto LABEL_177;
    }
    if (self->_isScreenSharingAvailable)
    {
      if (!*((unsigned char *)v4 + 95)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 95))
    {
      goto LABEL_177;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0) {
      goto LABEL_177;
    }
    if (self->_isGondolaCallingAvailable)
    {
      if (!*((unsigned char *)v4 + 90)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 90))
    {
      goto LABEL_177;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0) {
      goto LABEL_177;
    }
    if (self->_isPersonaAvailable)
    {
      if (!*((unsigned char *)v4 + 93)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 93))
    {
      goto LABEL_177;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0) {
      goto LABEL_177;
    }
    if (self->_isLightweight)
    {
      if (!*((unsigned char *)v4 + 91)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 91))
    {
      goto LABEL_177;
    }
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&v9 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_sharePlayProtocolVersion != *((_DWORD *)v4 + 17)) {
      goto LABEL_177;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_options != *((_DWORD *)v4 + 12)) {
      goto LABEL_177;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0) {
      goto LABEL_177;
    }
    if (self->_isGFTDowngradeToOneToOneAvailable)
    {
      if (!*((unsigned char *)v4 + 89)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 89))
    {
      goto LABEL_177;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0) {
      goto LABEL_177;
    }
    if (self->_guestModeEnabled)
    {
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 88))
    {
      goto LABEL_177;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_177;
  }
  association = self->_association;
  if ((unint64_t)association | *((void *)v4 + 2))
  {
    if (!-[CSDMessagingConversationParticipantAssociation isEqual:](association, "isEqual:")) {
      goto LABEL_177;
    }
    $F38001990BA1E94C86B335DE43A22703 v9 = self->_has;
  }
  int v12 = *((_DWORD *)v4 + 26);
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
    if ((v12 & 0x40000) == 0) {
      goto LABEL_177;
    }
    if (self->_isUPlusNDowngradeAvailable)
    {
      if (!*((unsigned char *)v4 + 97)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 97))
    {
      goto LABEL_177;
    }
  }
  else if ((v12 & 0x40000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&v9 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_avMode != *((_DWORD *)v4 + 6)) {
      goto LABEL_177;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&v9 & 0x400000) != 0)
  {
    if ((v12 & 0x400000) == 0) {
      goto LABEL_177;
    }
    if (self->_supportsLeaveContext)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_177;
    }
  }
  else if ((v12 & 0x400000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&v9 & 0x100000) != 0)
  {
    if ((v12 & 0x100000) == 0) {
      goto LABEL_177;
    }
    if (self->_isUPlusOneScreenSharingAvailable)
    {
      if (!*((unsigned char *)v4 + 99)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 99))
    {
      goto LABEL_177;
    }
  }
  else if ((v12 & 0x100000) != 0)
  {
    goto LABEL_177;
  }
  personaHandshakeData = self->_personaHandshakeData;
  if ((unint64_t)personaHandshakeData | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](personaHandshakeData, "isEqual:")) {
      goto LABEL_177;
    }
    $F38001990BA1E94C86B335DE43A22703 v9 = self->_has;
  }
  int v14 = *((_DWORD *)v4 + 26);
  if ((*(_DWORD *)&v9 & 0x20000) != 0)
  {
    if ((v14 & 0x20000) == 0) {
      goto LABEL_177;
    }
    if (self->_isSpatialPersonaEnabled)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_177;
    }
  }
  else if ((v14 & 0x20000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&v9 & 0x80000) != 0)
  {
    if ((v14 & 0x80000) == 0) {
      goto LABEL_177;
    }
    if (self->_isUPlusOneAVLessAvailable)
    {
      if (!*((unsigned char *)v4 + 98)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 98))
    {
      goto LABEL_177;
    }
  }
  else if ((v14 & 0x80000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&v9 & 0x100) != 0)
  {
    if ((v14 & 0x100) == 0 || self->_visionFeatureVersion != *((_DWORD *)v4 + 21)) {
      goto LABEL_177;
    }
  }
  else if ((v14 & 0x100) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&v9 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0 || self->_visionCallEstablishmentVersion != *((_DWORD *)v4 + 20)) {
      goto LABEL_177;
    }
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&v9 & 0x200000) != 0)
  {
    if ((v14 & 0x200000) == 0) {
      goto LABEL_177;
    }
    if (self->_isUPlusOneVisionToVisionAvailable)
    {
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 100))
    {
      goto LABEL_177;
    }
  }
  else if ((v14 & 0x200000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    if ((v14 & 0x800000) == 0) {
      goto LABEL_177;
    }
    if (self->_supportsRequestToScreenShare)
    {
      if (!*((unsigned char *)v4 + 102)) {
        goto LABEL_177;
      }
    }
    else if (*((unsigned char *)v4 + 102))
    {
      goto LABEL_177;
    }
  }
  else if ((v14 & 0x800000) != 0)
  {
    goto LABEL_177;
  }
  if ((*(unsigned char *)&v9 & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0 || self->_spatialPersonaGenerationCounter != *((_DWORD *)v4 + 18)) {
      goto LABEL_177;
    }
  }
  else if ((v14 & 0x20) != 0)
  {
    goto LABEL_177;
  }
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    if ((v14 & 0x8000) != 0)
    {
      if (self->_isPhotosSharePlayAvailable)
      {
        if (!*((unsigned char *)v4 + 94)) {
          goto LABEL_177;
        }
        goto LABEL_172;
      }
      if (!*((unsigned char *)v4 + 94)) {
        goto LABEL_172;
      }
    }
LABEL_177:
    BOOL v15 = 0;
    goto LABEL_178;
  }
  if ((v14 & 0x8000) != 0) {
    goto LABEL_177;
  }
LABEL_172:
  if ((*(unsigned char *)&v9 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_presentationMode != *((_DWORD *)v4 + 16)) {
      goto LABEL_177;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (*((_DWORD *)v4 + 26) & 8) == 0;
  }
LABEL_178:

  return v15;
}

- (unint64_t)hash
{
  $F38001990BA1E94C86B335DE43A22703 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    uint64_t v35 = 2654435761 * self->_version;
    if (*(unsigned char *)&has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v35 = 0;
    if (*(unsigned char *)&has)
    {
LABEL_3:
      unint64_t v34 = 2654435761u * self->_identifier;
      goto LABEL_6;
    }
  }
  unint64_t v34 = 0;
LABEL_6:
  unint64_t v33 = [(CSDMessagingHandle *)self->_handle hash];
  unint64_t v32 = (unint64_t)[(NSData *)self->_avcData hash];
  $F38001990BA1E94C86B335DE43A22703 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
    uint64_t v31 = 2654435761 * self->_isMomentsAvailable;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
    {
LABEL_8:
      uint64_t v30 = 2654435761 * self->_isScreenSharingAvailable;
      if ((*(_WORD *)&v4 & 0x800) != 0) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v30 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_9:
    uint64_t v29 = 2654435761 * self->_isGondolaCallingAvailable;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v29 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_10:
    uint64_t v28 = 2654435761 * self->_isPersonaAvailable;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v28 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_11:
    uint64_t v27 = 2654435761 * self->_isLightweight;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v27 = 0;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
LABEL_12:
    uint64_t v26 = 2654435761 * self->_sharePlayProtocolVersion;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v26 = 0;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_13:
    uint64_t v25 = 2654435761 * self->_options;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_14;
    }
LABEL_23:
    uint64_t v5 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v25 = 0;
  if ((*(_WORD *)&v4 & 0x400) == 0) {
    goto LABEL_23;
  }
LABEL_14:
  uint64_t v5 = 2654435761 * self->_isGFTDowngradeToOneToOneAvailable;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_15:
    uint64_t v6 = 2654435761 * self->_guestModeEnabled;
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v6 = 0;
LABEL_25:
  unint64_t v7 = [(CSDMessagingConversationParticipantAssociation *)self->_association hash];
  $F38001990BA1E94C86B335DE43A22703 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) != 0)
  {
    uint64_t v9 = 2654435761 * self->_isUPlusNDowngradeAvailable;
    if ((*(unsigned char *)&v8 & 2) != 0)
    {
LABEL_27:
      uint64_t v10 = 2654435761 * self->_avMode;
      if ((*(_DWORD *)&v8 & 0x400000) != 0) {
        goto LABEL_28;
      }
LABEL_32:
      uint64_t v11 = 0;
      if ((*(_DWORD *)&v8 & 0x100000) != 0) {
        goto LABEL_29;
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&v8 & 2) != 0) {
      goto LABEL_27;
    }
  }
  uint64_t v10 = 0;
  if ((*(_DWORD *)&v8 & 0x400000) == 0) {
    goto LABEL_32;
  }
LABEL_28:
  uint64_t v11 = 2654435761 * self->_supportsLeaveContext;
  if ((*(_DWORD *)&v8 & 0x100000) != 0)
  {
LABEL_29:
    uint64_t v12 = 2654435761 * self->_isUPlusOneScreenSharingAvailable;
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v12 = 0;
LABEL_34:
  unint64_t v13 = (unint64_t)[(NSData *)self->_personaHandshakeData hash];
  $F38001990BA1E94C86B335DE43A22703 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    uint64_t v15 = 2654435761 * self->_isSpatialPersonaEnabled;
    if ((*(_DWORD *)&v14 & 0x80000) != 0)
    {
LABEL_36:
      uint64_t v16 = 2654435761 * self->_isUPlusOneAVLessAvailable;
      if ((*(_WORD *)&v14 & 0x100) != 0) {
        goto LABEL_37;
      }
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((*(_DWORD *)&v14 & 0x80000) != 0) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = 0;
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
LABEL_37:
    uint64_t v17 = 2654435761 * self->_visionFeatureVersion;
    if ((*(unsigned char *)&v14 & 0x80) != 0) {
      goto LABEL_38;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&v14 & 0x80) != 0)
  {
LABEL_38:
    uint64_t v18 = 2654435761 * self->_visionCallEstablishmentVersion;
    if ((*(_DWORD *)&v14 & 0x200000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
LABEL_39:
    uint64_t v19 = 2654435761 * self->_isUPlusOneVisionToVisionAvailable;
    if ((*(_DWORD *)&v14 & 0x800000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
LABEL_40:
    uint64_t v20 = 2654435761 * self->_supportsRequestToScreenShare;
    if ((*(unsigned char *)&v14 & 0x20) != 0) {
      goto LABEL_41;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&v14 & 0x20) != 0)
  {
LABEL_41:
    uint64_t v21 = 2654435761 * self->_spatialPersonaGenerationCounter;
    if ((*(_WORD *)&v14 & 0x8000) != 0) {
      goto LABEL_42;
    }
LABEL_51:
    uint64_t v22 = 0;
    if ((*(unsigned char *)&v14 & 8) != 0) {
      goto LABEL_43;
    }
LABEL_52:
    uint64_t v23 = 0;
    return v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_50:
  uint64_t v21 = 0;
  if ((*(_WORD *)&v14 & 0x8000) == 0) {
    goto LABEL_51;
  }
LABEL_42:
  uint64_t v22 = 2654435761 * self->_isPhotosSharePlayAvailable;
  if ((*(unsigned char *)&v14 & 8) == 0) {
    goto LABEL_52;
  }
LABEL_43:
  uint64_t v23 = 2654435761 * self->_presentationMode;
  return v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x40) != 0)
  {
    self->_version = *((_DWORD *)v4 + 19);
    *(_DWORD *)&self->_has |= 0x40u;
    int v6 = *((_DWORD *)v4 + 26);
  }
  if (v6)
  {
    self->_identifier = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  handle = self->_handle;
  uint64_t v8 = *((void *)v5 + 5);
  id v14 = v5;
  if (handle)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[CSDMessagingConversationParticipant setHandle:](self, "setHandle:");
  }
  id v5 = v14;
LABEL_11:
  if (*((void *)v5 + 4))
  {
    -[CSDMessagingConversationParticipant setAvcData:](self, "setAvcData:");
    id v5 = v14;
  }
  int v9 = *((_DWORD *)v5 + 26);
  if ((v9 & 0x2000) != 0)
  {
    self->_isMomentsAvailable = *((unsigned char *)v5 + 92);
    *(_DWORD *)&self->_has |= 0x2000u;
    int v9 = *((_DWORD *)v5 + 26);
    if ((v9 & 0x10000) == 0)
    {
LABEL_15:
      if ((v9 & 0x800) == 0) {
        goto LABEL_16;
      }
      goto LABEL_28;
    }
  }
  else if ((v9 & 0x10000) == 0)
  {
    goto LABEL_15;
  }
  self->_isScreenSharingAvailable = *((unsigned char *)v5 + 95);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v9 = *((_DWORD *)v5 + 26);
  if ((v9 & 0x800) == 0)
  {
LABEL_16:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_isGondolaCallingAvailable = *((unsigned char *)v5 + 90);
  *(_DWORD *)&self->_has |= 0x800u;
  int v9 = *((_DWORD *)v5 + 26);
  if ((v9 & 0x4000) == 0)
  {
LABEL_17:
    if ((v9 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_isPersonaAvailable = *((unsigned char *)v5 + 93);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v9 = *((_DWORD *)v5 + 26);
  if ((v9 & 0x1000) == 0)
  {
LABEL_18:
    if ((v9 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_isLightweight = *((unsigned char *)v5 + 91);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v9 = *((_DWORD *)v5 + 26);
  if ((v9 & 0x10) == 0)
  {
LABEL_19:
    if ((v9 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_sharePlayProtocolVersion = *((_DWORD *)v5 + 17);
  *(_DWORD *)&self->_has |= 0x10u;
  int v9 = *((_DWORD *)v5 + 26);
  if ((v9 & 4) == 0)
  {
LABEL_20:
    if ((v9 & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_options = *((_DWORD *)v5 + 12);
  *(_DWORD *)&self->_has |= 4u;
  int v9 = *((_DWORD *)v5 + 26);
  if ((v9 & 0x400) == 0)
  {
LABEL_21:
    if ((v9 & 0x200) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_33:
  self->_isGFTDowngradeToOneToOneAvailable = *((unsigned char *)v5 + 89);
  *(_DWORD *)&self->_has |= 0x400u;
  if ((*((_DWORD *)v5 + 26) & 0x200) != 0)
  {
LABEL_22:
    self->_guestModeEnabled = *((unsigned char *)v5 + 88);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_23:
  association = self->_association;
  uint64_t v11 = *((void *)v5 + 2);
  if (association)
  {
    if (!v11) {
      goto LABEL_38;
    }
    -[CSDMessagingConversationParticipantAssociation mergeFrom:](association, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_38;
    }
    -[CSDMessagingConversationParticipant setAssociation:](self, "setAssociation:");
  }
  id v5 = v14;
LABEL_38:
  int v12 = *((_DWORD *)v5 + 26);
  if ((v12 & 0x40000) != 0)
  {
    self->_isUPlusNDowngradeAvailable = *((unsigned char *)v5 + 97);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v12 = *((_DWORD *)v5 + 26);
    if ((v12 & 2) == 0)
    {
LABEL_40:
      if ((v12 & 0x400000) == 0) {
        goto LABEL_41;
      }
      goto LABEL_60;
    }
  }
  else if ((v12 & 2) == 0)
  {
    goto LABEL_40;
  }
  self->_uint64_t avMode = *((_DWORD *)v5 + 6);
  *(_DWORD *)&self->_has |= 2u;
  int v12 = *((_DWORD *)v5 + 26);
  if ((v12 & 0x400000) == 0)
  {
LABEL_41:
    if ((v12 & 0x100000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_60:
  self->_supportsLeaveContext = *((unsigned char *)v5 + 101);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)v5 + 26) & 0x100000) != 0)
  {
LABEL_42:
    self->_isUPlusOneScreenSharingAvailable = *((unsigned char *)v5 + 99);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_43:
  if (*((void *)v5 + 7))
  {
    -[CSDMessagingConversationParticipant setPersonaHandshakeData:](self, "setPersonaHandshakeData:");
    id v5 = v14;
  }
  int v13 = *((_DWORD *)v5 + 26);
  if ((v13 & 0x20000) != 0)
  {
    self->_isSpatialPersonaEnabled = *((unsigned char *)v5 + 96);
    *(_DWORD *)&self->_has |= 0x20000u;
    int v13 = *((_DWORD *)v5 + 26);
    if ((v13 & 0x80000) == 0)
    {
LABEL_47:
      if ((v13 & 0x100) == 0) {
        goto LABEL_48;
      }
      goto LABEL_64;
    }
  }
  else if ((v13 & 0x80000) == 0)
  {
    goto LABEL_47;
  }
  self->_isUPlusOneAVLessAvailable = *((unsigned char *)v5 + 98);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v13 = *((_DWORD *)v5 + 26);
  if ((v13 & 0x100) == 0)
  {
LABEL_48:
    if ((v13 & 0x80) == 0) {
      goto LABEL_49;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_visionFeatureVersion = *((_DWORD *)v5 + 21);
  *(_DWORD *)&self->_has |= 0x100u;
  int v13 = *((_DWORD *)v5 + 26);
  if ((v13 & 0x80) == 0)
  {
LABEL_49:
    if ((v13 & 0x200000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_visionCallEstablishmentVersion = *((_DWORD *)v5 + 20);
  *(_DWORD *)&self->_has |= 0x80u;
  int v13 = *((_DWORD *)v5 + 26);
  if ((v13 & 0x200000) == 0)
  {
LABEL_50:
    if ((v13 & 0x800000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_isUPlusOneVisionToVisionAvailable = *((unsigned char *)v5 + 100);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v13 = *((_DWORD *)v5 + 26);
  if ((v13 & 0x800000) == 0)
  {
LABEL_51:
    if ((v13 & 0x20) == 0) {
      goto LABEL_52;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_supportsRequestToScreenShare = *((unsigned char *)v5 + 102);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v13 = *((_DWORD *)v5 + 26);
  if ((v13 & 0x20) == 0)
  {
LABEL_52:
    if ((v13 & 0x8000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_spatialPersonaGenerationCounter = *((_DWORD *)v5 + 18);
  *(_DWORD *)&self->_has |= 0x20u;
  int v13 = *((_DWORD *)v5 + 26);
  if ((v13 & 0x8000) == 0)
  {
LABEL_53:
    if ((v13 & 8) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_69:
  self->_isPhotosSharePlayAvailable = *((unsigned char *)v5 + 94);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v5 + 26) & 8) != 0)
  {
LABEL_54:
    self->_uint64_t presentationMode = *((_DWORD *)v5 + 16);
    *(_DWORD *)&self->_has |= 8u;
  }
LABEL_55:
}

- (unsigned)version
{
  return self->_version;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSData)avcData
{
  return self->_avcData;
}

- (void)setAvcData:(id)a3
{
}

- (BOOL)isMomentsAvailable
{
  return self->_isMomentsAvailable;
}

- (BOOL)isScreenSharingAvailable
{
  return self->_isScreenSharingAvailable;
}

- (BOOL)isGondolaCallingAvailable
{
  return self->_isGondolaCallingAvailable;
}

- (BOOL)isPersonaAvailable
{
  return self->_isPersonaAvailable;
}

- (BOOL)isLightweight
{
  return self->_isLightweight;
}

- (unsigned)sharePlayProtocolVersion
{
  return self->_sharePlayProtocolVersion;
}

- (unsigned)options
{
  return self->_options;
}

- (BOOL)isGFTDowngradeToOneToOneAvailable
{
  return self->_isGFTDowngradeToOneToOneAvailable;
}

- (BOOL)guestModeEnabled
{
  return self->_guestModeEnabled;
}

- (CSDMessagingConversationParticipantAssociation)association
{
  return self->_association;
}

- (void)setAssociation:(id)a3
{
}

- (BOOL)isUPlusNDowngradeAvailable
{
  return self->_isUPlusNDowngradeAvailable;
}

- (BOOL)supportsLeaveContext
{
  return self->_supportsLeaveContext;
}

- (BOOL)isUPlusOneScreenSharingAvailable
{
  return self->_isUPlusOneScreenSharingAvailable;
}

- (NSData)personaHandshakeData
{
  return self->_personaHandshakeData;
}

- (void)setPersonaHandshakeData:(id)a3
{
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

- (BOOL)isUPlusOneVisionToVisionAvailable
{
  return self->_isUPlusOneVisionToVisionAvailable;
}

- (BOOL)supportsRequestToScreenShare
{
  return self->_supportsRequestToScreenShare;
}

- (unsigned)spatialPersonaGenerationCounter
{
  return self->_spatialPersonaGenerationCounter;
}

- (BOOL)isPhotosSharePlayAvailable
{
  return self->_isPhotosSharePlayAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaHandshakeData, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_avcData, 0);

  objc_storeStrong((id *)&self->_association, 0);
}

+ (id)participantWithCSDConversationJoinContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CSDMessagingConversationParticipant);
  -[CSDMessagingConversationParticipant setIsMomentsAvailable:](v4, "setIsMomentsAvailable:", [v3 isMomentsAvailable]);
  -[CSDMessagingConversationParticipant setIsScreenSharingAvailable:](v4, "setIsScreenSharingAvailable:", [v3 isScreenSharingAvailable]);
  -[CSDMessagingConversationParticipant setIsGondolaCallingAvailable:](v4, "setIsGondolaCallingAvailable:", [v3 isGondolaCallingAvailable]);
  -[CSDMessagingConversationParticipant setIsPersonaAvailable:](v4, "setIsPersonaAvailable:", [v3 isPersonaAvailable]);
  -[CSDMessagingConversationParticipant setIsGFTDowngradeToOneToOneAvailable:](v4, "setIsGFTDowngradeToOneToOneAvailable:", [v3 isGFTDowngradeToOneToOneAvailable]);
  -[CSDMessagingConversationParticipant setIsUPlusOneScreenSharingAvailable:](v4, "setIsUPlusOneScreenSharingAvailable:", [v3 isUPlusOneScreenSharingAvailable]);
  -[CSDMessagingConversationParticipant setSupportsLeaveContext:](v4, "setSupportsLeaveContext:", [v3 supportsLeaveContext]);
  -[CSDMessagingConversationParticipant setIsUPlusNDowngradeAvailable:](v4, "setIsUPlusNDowngradeAvailable:", [v3 isUPlusNDowngradeAvailable]);
  -[CSDMessagingConversationParticipant setIsLightweight:](v4, "setIsLightweight:", [v3 isLightweight]);
  -[CSDMessagingConversationParticipant setSharePlayProtocolVersion:](v4, "setSharePlayProtocolVersion:", [v3 sharePlayProtocolVersion]);
  -[CSDMessagingConversationParticipant setVisionFeatureVersion:](v4, "setVisionFeatureVersion:", [v3 visionFeatureVersion]);
  -[CSDMessagingConversationParticipant setVisionCallEstablishmentVersion:](v4, "setVisionCallEstablishmentVersion:", [v3 visionCallEstablishmentVersion]);
  id v5 = [v3 participantAssociation];
  [(CSDMessagingConversationParticipant *)v4 setAssociation:v5];

  -[CSDMessagingConversationParticipant setIsSpatialPersonaEnabled:](v4, "setIsSpatialPersonaEnabled:", [v3 isSpatialPersonaEnabled]);
  -[CSDMessagingConversationParticipant setIsUPlusOneVisionToVisionAvailable:](v4, "setIsUPlusOneVisionToVisionAvailable:", [v3 isUPlusOneVisionToVisionAvailable]);
  -[CSDMessagingConversationParticipant setIsUPlusOneAVLessAvailable:](v4, "setIsUPlusOneAVLessAvailable:", [v3 isUPlusOneAVLessAvailable]);
  -[CSDMessagingConversationParticipant setSupportsRequestToScreenShare:](v4, "setSupportsRequestToScreenShare:", [v3 supportsRequestToScreenShare]);
  -[CSDMessagingConversationParticipant setIsPhotosSharePlayAvailable:](v4, "setIsPhotosSharePlayAvailable:", [v3 isPhotosSharePlayAvailable]);
  id v6 = [v3 videoEnabled];
  unint64_t v7 = [v3 message];
  -[CSDMessagingConversationParticipant setAvMode:](v4, "setAvMode:", [v7 avMode]);

  uint64_t v8 = [v3 message];

  -[CSDMessagingConversationParticipant setPresentationMode:](v4, "setPresentationMode:", [v8 resolvedPresentationMode]);
  [(CSDMessagingConversationParticipant *)v4 setOptions:v6];

  return v4;
}

+ (id)participantWithCSDConversationParticipant:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CSDMessagingConversationParticipant);
  -[CSDMessagingConversationParticipant setIdentifier:](v4, "setIdentifier:", [v3 identifier]);
  id v5 = [v3 handle];
  id v6 = +[CSDMessagingHandle handleWithTUHandle:v5];
  [(CSDMessagingConversationParticipant *)v4 setHandle:v6];

  unint64_t v7 = [v3 avcData];
  [(CSDMessagingConversationParticipant *)v4 setAvcData:v7];

  uint64_t v8 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsMomentsAvailable:](v4, "setIsMomentsAvailable:", [v8 isMomentsAvailable]);

  int v9 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsScreenSharingAvailable:](v4, "setIsScreenSharingAvailable:", [v9 isScreenSharingAvailable]);

  uint64_t v10 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsGondolaCallingAvailable:](v4, "setIsGondolaCallingAvailable:", [v10 isGondolaCallingAvailable]);

  uint64_t v11 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsPersonaAvailable:](v4, "setIsPersonaAvailable:", [v11 isPersonaAvailable]);

  int v12 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsGFTDowngradeToOneToOneAvailable:](v4, "setIsGFTDowngradeToOneToOneAvailable:", [v12 isGFTDowngradeToOneToOneAvailable]);

  int v13 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsUPlusOneScreenSharingAvailable:](v4, "setIsUPlusOneScreenSharingAvailable:", [v13 isUPlusOneScreenShareAvailable]);

  id v14 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsUPlusOneAVLessAvailable:](v4, "setIsUPlusOneAVLessAvailable:", [v14 isUPlusOneAVLessAvailable]);

  uint64_t v15 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setSupportsLeaveContext:](v4, "setSupportsLeaveContext:", [v15 supportsLeaveContext]);

  uint64_t v16 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setSupportsRequestToScreenShare:](v4, "setSupportsRequestToScreenShare:", [v16 supportsRequestToScreenShare]);

  uint64_t v17 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsUPlusNDowngradeAvailable:](v4, "setIsUPlusNDowngradeAvailable:", [v17 isUPlusNDowngradeAvailable]);

  -[CSDMessagingConversationParticipant setIsLightweight:](v4, "setIsLightweight:", [v3 isLightweight]);
  uint64_t v18 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setSharePlayProtocolVersion:](v4, "setSharePlayProtocolVersion:", [v18 sharePlayProtocolVersion]);

  uint64_t v19 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setVisionFeatureVersion:](v4, "setVisionFeatureVersion:", [v19 visionFeatureVersion]);

  uint64_t v20 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setVisionCallEstablishmentVersion:](v4, "setVisionCallEstablishmentVersion:", [v20 visionCallEstablishmentVersion]);

  uint64_t v21 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsUPlusOneVisionToVisionAvailable:](v4, "setIsUPlusOneVisionToVisionAvailable:", [v21 isUPlusOneVisionToVisionAvailable]);

  uint64_t v22 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsPhotosSharePlayAvailable:](v4, "setIsPhotosSharePlayAvailable:", [v22 isPhotosSharePlayAvailable]);

  -[CSDMessagingConversationParticipant setGuestModeEnabled:](v4, "setGuestModeEnabled:", [v3 isGuestModeEnabled]);
  uint64_t v23 = [v3 association];
  v24 = +[CSDMessagingConversationParticipantAssociation participantAssociationWithTUConversationParticipantAssociation:v23];
  [(CSDMessagingConversationParticipant *)v4 setAssociation:v24];

  -[CSDMessagingConversationParticipant setIsSpatialPersonaEnabled:](v4, "setIsSpatialPersonaEnabled:", [v3 isSpatialPersonaEnabled]);
  -[CSDMessagingConversationParticipant setSpatialPersonaGenerationCounter:](v4, "setSpatialPersonaGenerationCounter:", [v3 spatialPersonaGenerationCounter]);
  -[CSDMessagingConversationParticipant setPresentationMode:](v4, "setPresentationMode:", [v3 presentationMode]);
  id v25 = [v3 isVideoEnabled];
  id v26 = [v3 audioVideoMode];

  [(CSDMessagingConversationParticipant *)v4 setAvMode:v26];
  [(CSDMessagingConversationParticipant *)v4 setOptions:v25];

  return v4;
}

+ (id)participantWithTUConversationParticipant:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CSDMessagingConversationParticipant);
  -[CSDMessagingConversationParticipant setIdentifier:](v4, "setIdentifier:", [v3 identifier]);
  id v5 = [v3 handle];
  id v6 = +[CSDMessagingHandle handleWithTUHandle:v5];
  [(CSDMessagingConversationParticipant *)v4 setHandle:v6];

  unint64_t v7 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsMomentsAvailable:](v4, "setIsMomentsAvailable:", [v7 isMomentsAvailable]);

  uint64_t v8 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsScreenSharingAvailable:](v4, "setIsScreenSharingAvailable:", [v8 isScreenSharingAvailable]);

  int v9 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsGondolaCallingAvailable:](v4, "setIsGondolaCallingAvailable:", [v9 isGondolaCallingAvailable]);

  uint64_t v10 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsPersonaAvailable:](v4, "setIsPersonaAvailable:", [v10 isPersonaAvailable]);

  uint64_t v11 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsGFTDowngradeToOneToOneAvailable:](v4, "setIsGFTDowngradeToOneToOneAvailable:", [v11 isGFTDowngradeToOneToOneAvailable]);

  int v12 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsUPlusOneScreenSharingAvailable:](v4, "setIsUPlusOneScreenSharingAvailable:", [v12 isUPlusOneScreenShareAvailable]);

  int v13 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsUPlusOneAVLessAvailable:](v4, "setIsUPlusOneAVLessAvailable:", [v13 isUPlusOneAVLessAvailable]);

  id v14 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setSupportsLeaveContext:](v4, "setSupportsLeaveContext:", [v14 supportsLeaveContext]);

  uint64_t v15 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setSupportsRequestToScreenShare:](v4, "setSupportsRequestToScreenShare:", [v15 supportsRequestToScreenShare]);

  uint64_t v16 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsUPlusNDowngradeAvailable:](v4, "setIsUPlusNDowngradeAvailable:", [v16 isUPlusNDowngradeAvailable]);

  uint64_t v17 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsPhotosSharePlayAvailable:](v4, "setIsPhotosSharePlayAvailable:", [v17 isPhotosSharePlayAvailable]);

  -[CSDMessagingConversationParticipant setIsLightweight:](v4, "setIsLightweight:", [v3 isLightweight]);
  uint64_t v18 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setSharePlayProtocolVersion:](v4, "setSharePlayProtocolVersion:", [v18 sharePlayProtocolVersion]);

  uint64_t v19 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setVisionFeatureVersion:](v4, "setVisionFeatureVersion:", [v19 visionFeatureVersion]);

  uint64_t v20 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setVisionCallEstablishmentVersion:](v4, "setVisionCallEstablishmentVersion:", [v20 visionCallEstablishmentVersion]);

  uint64_t v21 = [v3 capabilities];
  -[CSDMessagingConversationParticipant setIsUPlusOneVisionToVisionAvailable:](v4, "setIsUPlusOneVisionToVisionAvailable:", [v21 isUPlusOneVisionToVisionAvailable]);

  -[CSDMessagingConversationParticipant setGuestModeEnabled:](v4, "setGuestModeEnabled:", [v3 isGuestModeEnabled]);
  uint64_t v22 = [v3 association];
  uint64_t v23 = +[CSDMessagingConversationParticipantAssociation participantAssociationWithTUConversationParticipantAssociation:v22];
  [(CSDMessagingConversationParticipant *)v4 setAssociation:v23];

  -[CSDMessagingConversationParticipant setIsSpatialPersonaEnabled:](v4, "setIsSpatialPersonaEnabled:", [v3 isSpatialPersonaEnabled]);
  id v24 = [v3 isVideoEnabled];
  -[CSDMessagingConversationParticipant setAvMode:](v4, "setAvMode:", [v3 audioVideoMode]);
  id v25 = [v3 presentationMode];

  [(CSDMessagingConversationParticipant *)v4 setPresentationMode:v25];
  [(CSDMessagingConversationParticipant *)v4 setOptions:v24];

  return v4;
}

- (CSDConversationParticipant)csdConversationParticipant
{
  id v3 = [CSDConversationParticipant alloc];
  unint64_t v4 = [(CSDMessagingConversationParticipant *)self identifier];
  id v5 = [(CSDMessagingConversationParticipant *)self handle];
  id v6 = [v5 tuHandle];
  unint64_t v7 = [(CSDMessagingConversationParticipant *)self avcData];
  uint64_t v8 = [(CSDConversationParticipant *)v3 initWithIdentifier:v4 handle:v6 avcData:v7];

  id v9 = objc_alloc_init((Class)TUConversationParticipantCapabilities);
  objc_msgSend(v9, "setMomentsAvailable:", -[CSDMessagingConversationParticipant isMomentsAvailable](self, "isMomentsAvailable"));
  objc_msgSend(v9, "setScreenSharingAvailable:", -[CSDMessagingConversationParticipant isScreenSharingAvailable](self, "isScreenSharingAvailable"));
  objc_msgSend(v9, "setGondolaCallingAvailable:", -[CSDMessagingConversationParticipant isGondolaCallingAvailable](self, "isGondolaCallingAvailable"));
  objc_msgSend(v9, "setPersonaAvailable:", -[CSDMessagingConversationParticipant isPersonaAvailable](self, "isPersonaAvailable"));
  objc_msgSend(v9, "setGftDowngradeToOneToOneAvailable:", -[CSDMessagingConversationParticipant isGFTDowngradeToOneToOneAvailable](self, "isGFTDowngradeToOneToOneAvailable"));
  objc_msgSend(v9, "setSupportsLeaveContext:", -[CSDMessagingConversationParticipant supportsLeaveContext](self, "supportsLeaveContext"));
  objc_msgSend(v9, "setSupportsRequestToScreenShare:", -[CSDMessagingConversationParticipant supportsRequestToScreenShare](self, "supportsRequestToScreenShare"));
  objc_msgSend(v9, "setUPlusNDowngradeAvailable:", -[CSDMessagingConversationParticipant isUPlusNDowngradeAvailable](self, "isUPlusNDowngradeAvailable"));
  objc_msgSend(v9, "setUPlusOneScreenShareAvailable:", -[CSDMessagingConversationParticipant isUPlusOneScreenSharingAvailable](self, "isUPlusOneScreenSharingAvailable"));
  objc_msgSend(v9, "setUPlusOneAVLessAvailable:", -[CSDMessagingConversationParticipant isUPlusOneAVLessAvailable](self, "isUPlusOneAVLessAvailable"));
  objc_msgSend(v9, "setSharePlayProtocolVersion:", -[CSDMessagingConversationParticipant sharePlayProtocolVersion](self, "sharePlayProtocolVersion"));
  objc_msgSend(v9, "setVisionFeatureVersion:", -[CSDMessagingConversationParticipant visionFeatureVersion](self, "visionFeatureVersion"));
  objc_msgSend(v9, "setVisionCallEstablishmentVersion:", -[CSDMessagingConversationParticipant visionCallEstablishmentVersion](self, "visionCallEstablishmentVersion"));
  objc_msgSend(v9, "setUPlusOneVisionToVisionAvailable:", -[CSDMessagingConversationParticipant isUPlusOneVisionToVisionAvailable](self, "isUPlusOneVisionToVisionAvailable"));
  objc_msgSend(v9, "setPhotosSharePlayAvailable:", -[CSDMessagingConversationParticipant isPhotosSharePlayAvailable](self, "isPhotosSharePlayAvailable"));
  [(CSDConversationParticipant *)v8 setCapabilities:v9];
  [(CSDConversationParticipant *)v8 setLightweight:[(CSDMessagingConversationParticipant *)self isLightweight]];
  [(CSDConversationParticipant *)v8 setGuestModeEnabled:[(CSDMessagingConversationParticipant *)self guestModeEnabled]];
  uint64_t v10 = [(CSDMessagingConversationParticipant *)self association];
  uint64_t v11 = [v10 tuConversationParticipantAssociation];
  [(CSDConversationParticipant *)v8 setAssociation:v11];

  [(CSDConversationParticipant *)v8 setSpatialPersonaEnabled:[(CSDMessagingConversationParticipant *)self isSpatialPersonaEnabled]];
  [(CSDConversationParticipant *)v8 setSpatialPersonaGenerationCounter:[(CSDMessagingConversationParticipant *)self spatialPersonaGenerationCounter]];
  [(CSDConversationParticipant *)v8 setVideoEnabled:[(CSDMessagingConversationParticipant *)self options] & 1 | ![(CSDMessagingConversationParticipant *)self hasOptions]];
  if ([(CSDMessagingConversationParticipant *)self hasAvMode])
  {
    uint64_t v12 = [(CSDMessagingConversationParticipant *)self avMode];
  }
  else if ([(CSDConversationParticipant *)v8 isVideoEnabled])
  {
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v12 = 1;
  }
  [(CSDConversationParticipant *)v8 setAudioVideoMode:v12];
  [(CSDConversationParticipant *)v8 setPresentationMode:[(CSDMessagingConversationParticipant *)self resolvedPresentationMode]];

  return v8;
}

- (unint64_t)resolvedPresentationMode
{
  if (![(CSDMessagingConversationParticipant *)self hasPresentationMode]) {
    return [(CSDMessagingConversationParticipant *)self avMode] == 0;
  }
  unsigned int v3 = [(CSDMessagingConversationParticipant *)self presentationMode];
  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CSDMessagingConversationParticipant;
  unsigned int v3 = [(CSDMessagingConversationParticipant *)&v8 description];
  unint64_t v4 = [(CSDMessagingConversationParticipant *)self dictionaryRepresentation];
  id v5 = TULoggableStringForObject();
  id v6 = +[NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

@end