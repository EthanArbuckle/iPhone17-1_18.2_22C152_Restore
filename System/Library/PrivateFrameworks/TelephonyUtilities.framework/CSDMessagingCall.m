@interface CSDMessagingCall
+ (Class)remoteParticipantHandlesType;
- (BOOL)hasCallerNameFromNetwork;
- (BOOL)hasDestinationID;
- (BOOL)hasGroupUUIDString;
- (BOOL)hasHandle;
- (BOOL)hasIsoCountryCode;
- (BOOL)hasLocalSenderIdentityAccountUUIDString;
- (BOOL)hasLocalSenderIdentityUUIDString;
- (BOOL)hasProtoCallModel;
- (BOOL)hasProtoConferenced;
- (BOOL)hasProtoDisconnectedReason;
- (BOOL)hasProtoEmergency;
- (BOOL)hasProtoFailureExpected;
- (BOOL)hasProtoHasSentInvitation;
- (BOOL)hasProtoNeedsManualInCallSounds;
- (BOOL)hasProtoOriginatingUIType;
- (BOOL)hasProtoOutgoing;
- (BOOL)hasProtoProvider;
- (BOOL)hasProtoSOS;
- (BOOL)hasProtoService;
- (BOOL)hasProtoShouldSuppressRingtone;
- (BOOL)hasProtoSoundRegion;
- (BOOL)hasProtoStatus;
- (BOOL)hasProtoSupportsDTMFUpdates;
- (BOOL)hasProtoSupportsEmergencyFallback;
- (BOOL)hasProtoSupportsTTYWithVoice;
- (BOOL)hasProtoTTYType;
- (BOOL)hasProtoTimeConnected;
- (BOOL)hasProtoUplinkMuted;
- (BOOL)hasProtoVideo;
- (BOOL)hasProtoVoicemail;
- (BOOL)hasProtoWantsHoldMusic;
- (BOOL)hasSourceIdentifier;
- (BOOL)hasUniqueProxyIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCall:(id)a3;
- (BOOL)isVideo;
- (BOOL)protoConferenced;
- (BOOL)protoEmergency;
- (BOOL)protoFailureExpected;
- (BOOL)protoHasSentInvitation;
- (BOOL)protoNeedsManualInCallSounds;
- (BOOL)protoOutgoing;
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
- (CSDMessagingCall)initWithCall:(id)a3;
- (CSDMessagingCallModel)protoCallModel;
- (CSDMessagingCallProvider)protoProvider;
- (CSDMessagingHandle)handle;
- (NSDate)dateConnected;
- (NSMutableArray)remoteParticipantHandles;
- (NSSet)remoteParticipantTUHandles;
- (NSString)callerNameFromNetwork;
- (NSString)destinationID;
- (NSString)groupUUIDString;
- (NSString)isoCountryCode;
- (NSString)localSenderIdentityAccountUUIDString;
- (NSString)localSenderIdentityUUIDString;
- (NSString)sourceIdentifier;
- (NSString)uniqueProxyIdentifier;
- (NSUUID)localSenderIdentityAccountUUID;
- (NSUUID)localSenderIdentityUUID;
- (TUCallModel)callModel;
- (TUCallProvider)tuProvider;
- (TUHandle)tuHandle;
- (double)protoTimeConnected;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)remoteParticipantHandlesAtIndex:(unint64_t)a3;
- (int64_t)soundRegion;
- (unint64_t)hash;
- (unint64_t)remoteParticipantHandlesCount;
- (unsigned)protoDisconnectedReason;
- (unsigned)protoOriginatingUIType;
- (unsigned)protoService;
- (unsigned)protoSoundRegion;
- (unsigned)protoStatus;
- (unsigned)protoTTYType;
- (void)addRemoteParticipantHandles:(id)a3;
- (void)clearRemoteParticipantHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCallModel:(id)a3;
- (void)setCallerNameFromNetwork:(id)a3;
- (void)setConferenced:(BOOL)a3;
- (void)setDateConnected:(id)a3;
- (void)setDestinationID:(id)a3;
- (void)setDisconnectedReason:(int)a3;
- (void)setEmergency:(BOOL)a3;
- (void)setFailureExpected:(BOOL)a3;
- (void)setGroupUUIDString:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHasProtoConferenced:(BOOL)a3;
- (void)setHasProtoDisconnectedReason:(BOOL)a3;
- (void)setHasProtoEmergency:(BOOL)a3;
- (void)setHasProtoFailureExpected:(BOOL)a3;
- (void)setHasProtoHasSentInvitation:(BOOL)a3;
- (void)setHasProtoNeedsManualInCallSounds:(BOOL)a3;
- (void)setHasProtoOriginatingUIType:(BOOL)a3;
- (void)setHasProtoOutgoing:(BOOL)a3;
- (void)setHasProtoSOS:(BOOL)a3;
- (void)setHasProtoService:(BOOL)a3;
- (void)setHasProtoShouldSuppressRingtone:(BOOL)a3;
- (void)setHasProtoSoundRegion:(BOOL)a3;
- (void)setHasProtoStatus:(BOOL)a3;
- (void)setHasProtoSupportsDTMFUpdates:(BOOL)a3;
- (void)setHasProtoSupportsEmergencyFallback:(BOOL)a3;
- (void)setHasProtoSupportsTTYWithVoice:(BOOL)a3;
- (void)setHasProtoTTYType:(BOOL)a3;
- (void)setHasProtoTimeConnected:(BOOL)a3;
- (void)setHasProtoUplinkMuted:(BOOL)a3;
- (void)setHasProtoVideo:(BOOL)a3;
- (void)setHasProtoVoicemail:(BOOL)a3;
- (void)setHasProtoWantsHoldMusic:(BOOL)a3;
- (void)setHasSentInvitation:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLocalSenderIdentityAccountUUID:(id)a3;
- (void)setLocalSenderIdentityAccountUUIDString:(id)a3;
- (void)setLocalSenderIdentityUUID:(id)a3;
- (void)setLocalSenderIdentityUUIDString:(id)a3;
- (void)setNeedsManualInCallSounds:(BOOL)a3;
- (void)setOriginatingUIType:(int)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setProtoCallModel:(id)a3;
- (void)setProtoConferenced:(BOOL)a3;
- (void)setProtoDisconnectedReason:(unsigned int)a3;
- (void)setProtoEmergency:(BOOL)a3;
- (void)setProtoFailureExpected:(BOOL)a3;
- (void)setProtoHasSentInvitation:(BOOL)a3;
- (void)setProtoNeedsManualInCallSounds:(BOOL)a3;
- (void)setProtoOriginatingUIType:(unsigned int)a3;
- (void)setProtoOutgoing:(BOOL)a3;
- (void)setProtoProvider:(id)a3;
- (void)setProtoSOS:(BOOL)a3;
- (void)setProtoService:(unsigned int)a3;
- (void)setProtoShouldSuppressRingtone:(BOOL)a3;
- (void)setProtoSoundRegion:(unsigned int)a3;
- (void)setProtoStatus:(unsigned int)a3;
- (void)setProtoSupportsDTMFUpdates:(BOOL)a3;
- (void)setProtoSupportsEmergencyFallback:(BOOL)a3;
- (void)setProtoSupportsTTYWithVoice:(BOOL)a3;
- (void)setProtoTTYType:(unsigned int)a3;
- (void)setProtoTimeConnected:(double)a3;
- (void)setProtoUplinkMuted:(BOOL)a3;
- (void)setProtoVideo:(BOOL)a3;
- (void)setProtoVoicemail:(BOOL)a3;
- (void)setProtoWantsHoldMusic:(BOOL)a3;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setRemoteParticipantTUHandles:(id)a3;
- (void)setSOS:(BOOL)a3;
- (void)setService:(int)a3;
- (void)setShouldSuppressRingtone:(BOOL)a3;
- (void)setSoundRegion:(int64_t)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setStatus:(int)a3;
- (void)setSupportsDTMFUpdates:(BOOL)a3;
- (void)setSupportsEmergencyFallback:(BOOL)a3;
- (void)setSupportsTTYWithVoice:(BOOL)a3;
- (void)setTtyType:(int)a3;
- (void)setTuHandle:(id)a3;
- (void)setTuProvider:(id)a3;
- (void)setTuProvider:(id)a3 isVideo:(BOOL)a4;
- (void)setUniqueProxyIdentifier:(id)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVoicemail:(BOOL)a3;
- (void)setWantsHoldMusic:(BOOL)a3;
- (void)updateRelayCall:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCall

- (BOOL)hasUniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier != 0;
}

- (void)setProtoStatus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_protoStatus = a3;
}

- (void)setHasProtoStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasProtoStatus
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setProtoConferenced:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_protoConferenced = a3;
}

- (void)setHasProtoConferenced:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasProtoConferenced
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasDestinationID
{
  return self->_destinationID != 0;
}

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0;
}

- (void)setProtoService:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_protoService = a3;
}

- (void)setHasProtoService:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasProtoService
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setProtoWantsHoldMusic:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_protoWantsHoldMusic = a3;
}

- (void)setHasProtoWantsHoldMusic:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasProtoWantsHoldMusic
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setProtoDisconnectedReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_protoDisconnectedReason = a3;
}

- (void)setHasProtoDisconnectedReason:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasProtoDisconnectedReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setProtoVoicemail:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_protoVoicemail = a3;
}

- (void)setHasProtoVoicemail:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasProtoVoicemail
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasCallerNameFromNetwork
{
  return self->_callerNameFromNetwork != 0;
}

- (void)setProtoTimeConnected:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_protoTimeConnected = a3;
}

- (void)setHasProtoTimeConnected:(BOOL)a3
{
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasProtoTimeConnected
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setProtoOutgoing:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_protoOutgoing = a3;
}

- (void)setHasProtoOutgoing:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasProtoOutgoing
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setProtoShouldSuppressRingtone:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_protoShouldSuppressRingtone = a3;
}

- (void)setHasProtoShouldSuppressRingtone:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasProtoShouldSuppressRingtone
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setProtoNeedsManualInCallSounds:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_protoNeedsManualInCallSounds = a3;
}

- (void)setHasProtoNeedsManualInCallSounds:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasProtoNeedsManualInCallSounds
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setProtoSoundRegion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_protoSoundRegion = a3;
}

- (void)setHasProtoSoundRegion:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasProtoSoundRegion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setProtoEmergency:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_protoEmergency = a3;
}

- (void)setHasProtoEmergency:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasProtoEmergency
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setProtoHasSentInvitation:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_protoHasSentInvitation = a3;
}

- (void)setHasProtoHasSentInvitation:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasProtoHasSentInvitation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (void)setProtoSOS:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_protoSOS = a3;
}

- (void)setHasProtoSOS:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasProtoSOS
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasProtoProvider
{
  return self->_protoProvider != 0;
}

- (void)setProtoVideo:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_protoVideo = a3;
}

- (void)setHasProtoVideo:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasProtoVideo
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setProtoUplinkMuted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_protoUplinkMuted = a3;
}

- (void)setHasProtoUplinkMuted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasProtoUplinkMuted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasProtoCallModel
{
  return self->_protoCallModel != 0;
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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_remoteParticipantHandles;
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
  *(_DWORD *)&self->_has |= 0x40u;
  self->_protoTTYType = a3;
}

- (void)setHasProtoTTYType:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasProtoTTYType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setProtoSupportsTTYWithVoice:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_protoSupportsTTYWithVoice = a3;
}

- (void)setHasProtoSupportsTTYWithVoice:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasProtoSupportsTTYWithVoice
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (void)setProtoOriginatingUIType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_protoOriginatingUIType = a3;
}

- (void)setHasProtoOriginatingUIType:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasProtoOriginatingUIType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setProtoFailureExpected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_protoFailureExpected = a3;
}

- (void)setHasProtoFailureExpected:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasProtoFailureExpected
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setProtoSupportsEmergencyFallback:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_protoSupportsEmergencyFallback = a3;
}

- (void)setHasProtoSupportsEmergencyFallback:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasProtoSupportsEmergencyFallback
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasGroupUUIDString
{
  return self->_groupUUIDString != 0;
}

- (void)setProtoSupportsDTMFUpdates:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_protoSupportsDTMFUpdates = a3;
}

- (void)setHasProtoSupportsDTMFUpdates:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FE257B6BB2BF625D40F79B47F1EB918B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasProtoSupportsDTMFUpdates
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingCall;
  int v3 = [(CSDMessagingCall *)&v7 description];
  id v4 = [(CSDMessagingCall *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  if (uniqueProxyIdentifier) {
    [v3 setObject:uniqueProxyIdentifier forKey:@"uniqueProxyIdentifier"];
  }
  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_protoStatus];
    [v4 setObject:v7 forKey:@"protoStatus"];

    $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    id v8 = +[NSNumber numberWithBool:self->_protoConferenced];
    [v4 setObject:v8 forKey:@"protoConferenced"];
  }
  destinationID = self->_destinationID;
  if (destinationID) {
    [v4 setObject:destinationID forKey:@"destinationID"];
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier) {
    [v4 setObject:sourceIdentifier forKey:@"sourceIdentifier"];
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
  if ((*(unsigned char *)&v11 & 8) != 0)
  {
    v45 = +[NSNumber numberWithUnsignedInt:self->_protoService];
    [v4 setObject:v45 forKey:@"protoService"];

    $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x200000) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v11 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x200000) == 0)
  {
    goto LABEL_13;
  }
  v46 = +[NSNumber numberWithBool:self->_protoWantsHoldMusic];
  [v4 setObject:v46 forKey:@"protoWantsHoldMusic"];

  $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
  if ((*(unsigned char *)&v11 & 2) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v11 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_68:
  v47 = +[NSNumber numberWithUnsignedInt:self->_protoDisconnectedReason];
  [v4 setObject:v47 forKey:@"protoDisconnectedReason"];

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_15:
    v12 = +[NSNumber numberWithBool:self->_protoVoicemail];
    [v4 setObject:v12 forKey:@"protoVoicemail"];
  }
LABEL_16:
  callerNameFromNetwork = self->_callerNameFromNetwork;
  if (callerNameFromNetwork) {
    [v4 setObject:callerNameFromNetwork forKey:@"callerNameFromNetwork"];
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v14 = self->_has;
  if (*(unsigned char *)&v14)
  {
    v48 = +[NSNumber numberWithDouble:self->_protoTimeConnected];
    [v4 setObject:v48 forKey:@"protoTimeConnected"];

    $FE257B6BB2BF625D40F79B47F1EB918B v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x1000) == 0)
    {
LABEL_20:
      if ((*(_WORD *)&v14 & 0x4000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
    goto LABEL_20;
  }
  v49 = +[NSNumber numberWithBool:self->_protoOutgoing];
  [v4 setObject:v49 forKey:@"protoOutgoing"];

  $FE257B6BB2BF625D40F79B47F1EB918B v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v14 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_73;
  }
LABEL_72:
  v50 = +[NSNumber numberWithBool:self->_protoShouldSuppressRingtone];
  [v4 setObject:v50 forKey:@"protoShouldSuppressRingtone"];

  $FE257B6BB2BF625D40F79B47F1EB918B v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v14 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_74;
  }
LABEL_73:
  v51 = +[NSNumber numberWithBool:self->_protoNeedsManualInCallSounds];
  [v4 setObject:v51 forKey:@"protoNeedsManualInCallSounds"];

  $FE257B6BB2BF625D40F79B47F1EB918B v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x10) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v14 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_75;
  }
LABEL_74:
  v52 = +[NSNumber numberWithUnsignedInt:self->_protoSoundRegion];
  [v4 setObject:v52 forKey:@"protoSoundRegion"];

  $FE257B6BB2BF625D40F79B47F1EB918B v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v14 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_75:
  v53 = +[NSNumber numberWithBool:self->_protoEmergency];
  [v4 setObject:v53 forKey:@"protoEmergency"];

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_25:
    v15 = +[NSNumber numberWithBool:self->_protoHasSentInvitation];
    [v4 setObject:v15 forKey:@"protoHasSentInvitation"];
  }
LABEL_26:
  handle = self->_handle;
  if (handle)
  {
    v17 = [(CSDMessagingHandle *)handle dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"handle"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    v18 = +[NSNumber numberWithBool:self->_protoSOS];
    [v4 setObject:v18 forKey:@"protoSOS"];
  }
  protoProvider = self->_protoProvider;
  if (protoProvider)
  {
    v20 = [(CSDMessagingCallProvider *)protoProvider dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"protoProvider"];
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) != 0)
  {
    v22 = +[NSNumber numberWithBool:self->_protoVideo];
    [v4 setObject:v22 forKey:@"protoVideo"];

    $FE257B6BB2BF625D40F79B47F1EB918B v21 = self->_has;
  }
  if ((*(_DWORD *)&v21 & 0x40000) != 0)
  {
    v23 = +[NSNumber numberWithBool:self->_protoUplinkMuted];
    [v4 setObject:v23 forKey:@"protoUplinkMuted"];
  }
  protoCallModel = self->_protoCallModel;
  if (protoCallModel)
  {
    v25 = [(CSDMessagingCallModel *)protoCallModel dictionaryRepresentation];
    [v4 setObject:v25 forKey:@"protoCallModel"];
  }
  localSenderIdentityUUIDString = self->_localSenderIdentityUUIDString;
  if (localSenderIdentityUUIDString) {
    [v4 setObject:localSenderIdentityUUIDString forKey:@"localSenderIdentityUUIDString"];
  }
  if ([(NSMutableArray *)self->_remoteParticipantHandles count])
  {
    id v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_remoteParticipantHandles, "count"));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v28 = self->_remoteParticipantHandles;
    id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v57;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v57 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * i), "dictionaryRepresentation", (void)v56);
          [v27 addObject:v33];
        }
        id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v30);
    }

    [v4 setObject:v27 forKey:@"remoteParticipantHandles"];
  }
  localSenderIdentityAccountUUIDString = self->_localSenderIdentityAccountUUIDString;
  if (localSenderIdentityAccountUUIDString) {
    [v4 setObject:localSenderIdentityAccountUUIDString forKey:@"localSenderIdentityAccountUUIDString"];
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v35 = self->_has;
  if ((*(unsigned char *)&v35 & 0x40) != 0)
  {
    v36 = +[NSNumber numberWithUnsignedInt:self->_protoTTYType];
    [v4 setObject:v36 forKey:@"protoTTYType"];

    $FE257B6BB2BF625D40F79B47F1EB918B v35 = self->_has;
  }
  if ((*(_DWORD *)&v35 & 0x20000) != 0)
  {
    v37 = +[NSNumber numberWithBool:self->_protoSupportsTTYWithVoice];
    [v4 setObject:v37 forKey:@"protoSupportsTTYWithVoice"];
  }
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode) {
    [v4 setObject:isoCountryCode forKey:@"isoCountryCode"];
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v39 = self->_has;
  if ((*(unsigned char *)&v39 & 4) != 0)
  {
    v54 = +[NSNumber numberWithUnsignedInt:self->_protoOriginatingUIType];
    [v4 setObject:v54 forKey:@"protoOriginatingUIType"];

    $FE257B6BB2BF625D40F79B47F1EB918B v39 = self->_has;
    if ((*(_WORD *)&v39 & 0x200) == 0)
    {
LABEL_59:
      if ((*(_DWORD *)&v39 & 0x10000) == 0) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
  }
  else if ((*(_WORD *)&v39 & 0x200) == 0)
  {
    goto LABEL_59;
  }
  v55 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_protoFailureExpected, (void)v56);
  [v4 setObject:v55 forKey:@"protoFailureExpected"];

  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_60:
    v40 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_protoSupportsEmergencyFallback, (void)v56);
    [v4 setObject:v40 forKey:@"protoSupportsEmergencyFallback"];
  }
LABEL_61:
  groupUUIDString = self->_groupUUIDString;
  if (groupUUIDString) {
    [v4 setObject:groupUUIDString forKey:@"groupUUIDString"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    v42 = +[NSNumber numberWithBool:self->_protoSupportsDTMFUpdates];
    [v4 setObject:v42 forKey:@"protoSupportsDTMFUpdates"];
  }
  id v43 = v4;

  return v43;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000AD994((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_uniqueProxyIdentifier) {
    PBDataWriterWriteStringField();
  }
  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_destinationID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceIdentifier) {
    PBDataWriterWriteStringField();
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    $FE257B6BB2BF625D40F79B47F1EB918B v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v6 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  $FE257B6BB2BF625D40F79B47F1EB918B v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_15:
  }
    PBDataWriterWriteBOOLField();
LABEL_16:
  if (self->_callerNameFromNetwork) {
    PBDataWriterWriteStringField();
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
  if (*(unsigned char *)&v7)
  {
    PBDataWriterWriteDoubleField();
    $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x1000) == 0)
    {
LABEL_20:
      if ((*(_WORD *)&v7 & 0x4000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_70;
    }
  }
  else if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteBOOLField();
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteBOOLField();
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteBOOLField();
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400) != 0) {
LABEL_25:
  }
    PBDataWriterWriteBOOLField();
LABEL_26:
  if (self->_handle) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_protoProvider) {
    PBDataWriterWriteSubmessage();
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $FE257B6BB2BF625D40F79B47F1EB918B v8 = self->_has;
  }
  if ((*(_DWORD *)&v8 & 0x40000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_protoCallModel) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_localSenderIdentityUUIDString) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = self->_remoteParticipantHandles;
  v10 = (char *)[(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    $FE257B6BB2BF625D40F79B47F1EB918B v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      $FE257B6BB2BF625D40F79B47F1EB918B v11 = (char *)[(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if (self->_localSenderIdentityAccountUUIDString) {
    PBDataWriterWriteStringField();
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    $FE257B6BB2BF625D40F79B47F1EB918B v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x20000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_isoCountryCode) {
    PBDataWriterWriteStringField();
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v15 = self->_has;
  if ((*(unsigned char *)&v15 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    $FE257B6BB2BF625D40F79B47F1EB918B v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x200) == 0)
    {
LABEL_57:
      if ((*(_DWORD *)&v15 & 0x10000) == 0) {
        goto LABEL_59;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&v15 & 0x200) == 0)
  {
    goto LABEL_57;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x10000) != 0) {
LABEL_58:
  }
    PBDataWriterWriteBOOLField();
LABEL_59:
  if (self->_groupUUIDString) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (self->_uniqueProxyIdentifier)
  {
    objc_msgSend(v4, "setUniqueProxyIdentifier:");
    id v4 = v16;
  }
  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_protoStatus;
    *((_DWORD *)v4 + 38) |= 0x20u;
    $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *((unsigned char *)v4 + 136) = self->_protoConferenced;
    *((_DWORD *)v4 + 38) |= 0x80u;
  }
  if (self->_destinationID)
  {
    objc_msgSend(v16, "setDestinationID:");
    id v4 = v16;
  }
  if (self->_sourceIdentifier)
  {
    objc_msgSend(v16, "setSourceIdentifier:");
    id v4 = v16;
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_protoService;
    *((_DWORD *)v4 + 38) |= 8u;
    $FE257B6BB2BF625D40F79B47F1EB918B v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v6 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
    goto LABEL_13;
  }
  *((unsigned char *)v4 + 150) = self->_protoWantsHoldMusic;
  *((_DWORD *)v4 + 38) |= 0x200000u;
  $FE257B6BB2BF625D40F79B47F1EB918B v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_65:
  *((_DWORD *)v4 + 20) = self->_protoDisconnectedReason;
  *((_DWORD *)v4 + 38) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_15:
    *((unsigned char *)v4 + 149) = self->_protoVoicemail;
    *((_DWORD *)v4 + 38) |= 0x100000u;
  }
LABEL_16:
  if (self->_callerNameFromNetwork)
  {
    objc_msgSend(v16, "setCallerNameFromNetwork:");
    id v4 = v16;
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
  if (*(unsigned char *)&v7)
  {
    *((void *)v4 + 1) = *(void *)&self->_protoTimeConnected;
    *((_DWORD *)v4 + 38) |= 1u;
    $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x1000) == 0)
    {
LABEL_20:
      if ((*(_WORD *)&v7 & 0x4000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
    goto LABEL_20;
  }
  *((unsigned char *)v4 + 141) = self->_protoOutgoing;
  *((_DWORD *)v4 + 38) |= 0x1000u;
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((unsigned char *)v4 + 143) = self->_protoShouldSuppressRingtone;
  *((_DWORD *)v4 + 38) |= 0x4000u;
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((unsigned char *)v4 + 140) = self->_protoNeedsManualInCallSounds;
  *((_DWORD *)v4 + 38) |= 0x800u;
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v4 + 25) = self->_protoSoundRegion;
  *((_DWORD *)v4 + 38) |= 0x10u;
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_72:
  *((unsigned char *)v4 + 137) = self->_protoEmergency;
  *((_DWORD *)v4 + 38) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_25:
    *((unsigned char *)v4 + 139) = self->_protoHasSentInvitation;
    *((_DWORD *)v4 + 38) |= 0x400u;
  }
LABEL_26:
  if (self->_handle)
  {
    objc_msgSend(v16, "setHandle:");
    id v4 = v16;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *((unsigned char *)v4 + 142) = self->_protoSOS;
    *((_DWORD *)v4 + 38) |= 0x2000u;
  }
  if (self->_protoProvider)
  {
    objc_msgSend(v16, "setProtoProvider:");
    id v4 = v16;
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) != 0)
  {
    *((unsigned char *)v4 + 148) = self->_protoVideo;
    *((_DWORD *)v4 + 38) |= 0x80000u;
    $FE257B6BB2BF625D40F79B47F1EB918B v8 = self->_has;
  }
  if ((*(_DWORD *)&v8 & 0x40000) != 0)
  {
    *((unsigned char *)v4 + 147) = self->_protoUplinkMuted;
    *((_DWORD *)v4 + 38) |= 0x40000u;
  }
  if (self->_protoCallModel) {
    objc_msgSend(v16, "setProtoCallModel:");
  }
  if (self->_localSenderIdentityUUIDString) {
    objc_msgSend(v16, "setLocalSenderIdentityUUIDString:");
  }
  if ([(CSDMessagingCall *)self remoteParticipantHandlesCount])
  {
    [v16 clearRemoteParticipantHandles];
    unint64_t v9 = [(CSDMessagingCall *)self remoteParticipantHandlesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
      {
        uint64_t v12 = [(CSDMessagingCall *)self remoteParticipantHandlesAtIndex:i];
        [v16 addRemoteParticipantHandles:v12];
      }
    }
  }
  if (self->_localSenderIdentityAccountUUIDString) {
    objc_msgSend(v16, "setLocalSenderIdentityAccountUUIDString:");
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v13 = self->_has;
  $FE257B6BB2BF625D40F79B47F1EB918B v14 = v16;
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
    *((_DWORD *)v16 + 27) = self->_protoTTYType;
    *((_DWORD *)v16 + 38) |= 0x40u;
    $FE257B6BB2BF625D40F79B47F1EB918B v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
    *((unsigned char *)v16 + 146) = self->_protoSupportsTTYWithVoice;
    *((_DWORD *)v16 + 38) |= 0x20000u;
  }
  if (self->_isoCountryCode)
  {
    objc_msgSend(v16, "setIsoCountryCode:");
    $FE257B6BB2BF625D40F79B47F1EB918B v14 = v16;
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v15 = self->_has;
  if ((*(unsigned char *)&v15 & 4) != 0)
  {
    v14[21] = self->_protoOriginatingUIType;
    v14[38] |= 4u;
    $FE257B6BB2BF625D40F79B47F1EB918B v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x200) == 0)
    {
LABEL_54:
      if ((*(_DWORD *)&v15 & 0x10000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&v15 & 0x200) == 0)
  {
    goto LABEL_54;
  }
  *((unsigned char *)v14 + 138) = self->_protoFailureExpected;
  v14[38] |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_55:
    *((unsigned char *)v14 + 145) = self->_protoSupportsEmergencyFallback;
    v14[38] |= 0x10000u;
  }
LABEL_56:
  if (self->_groupUUIDString)
  {
    objc_msgSend(v16, "setGroupUUIDString:");
    $FE257B6BB2BF625D40F79B47F1EB918B v14 = v16;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *((unsigned char *)v14 + 144) = self->_protoSupportsDTMFUpdates;
    v14[38] |= 0x8000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_uniqueProxyIdentifier copyWithZone:a3];
  $FE257B6BB2BF625D40F79B47F1EB918B v7 = (void *)v5[16];
  v5[16] = v6;

  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_protoStatus;
    *((_DWORD *)v5 + 38) |= 0x20u;
    $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *((unsigned char *)v5 + 136) = self->_protoConferenced;
    *((_DWORD *)v5 + 38) |= 0x80u;
  }
  id v9 = [(NSString *)self->_destinationID copyWithZone:a3];
  unint64_t v10 = (void *)v5[3];
  v5[3] = v9;

  id v11 = [(NSString *)self->_sourceIdentifier copyWithZone:a3];
  uint64_t v12 = (void *)v5[15];
  v5[15] = v11;

  $FE257B6BB2BF625D40F79B47F1EB918B v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_protoService;
    *((_DWORD *)v5 + 38) |= 8u;
    $FE257B6BB2BF625D40F79B47F1EB918B v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x200000) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&v13 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v5 + 150) = self->_protoWantsHoldMusic;
  *((_DWORD *)v5 + 38) |= 0x200000u;
  $FE257B6BB2BF625D40F79B47F1EB918B v13 = self->_has;
  if ((*(unsigned char *)&v13 & 2) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&v13 & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_44:
  *((_DWORD *)v5 + 20) = self->_protoDisconnectedReason;
  *((_DWORD *)v5 + 38) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_9:
    *((unsigned char *)v5 + 149) = self->_protoVoicemail;
    *((_DWORD *)v5 + 38) |= 0x100000u;
  }
LABEL_10:
  id v14 = [(NSString *)self->_callerNameFromNetwork copyWithZone:a3];
  $FE257B6BB2BF625D40F79B47F1EB918B v15 = (void *)v5[2];
  v5[2] = v14;

  $FE257B6BB2BF625D40F79B47F1EB918B v16 = self->_has;
  if (*(unsigned char *)&v16)
  {
    v5[1] = *(void *)&self->_protoTimeConnected;
    *((_DWORD *)v5 + 38) |= 1u;
    $FE257B6BB2BF625D40F79B47F1EB918B v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x1000) == 0)
    {
LABEL_12:
      if ((*(_WORD *)&v16 & 0x4000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&v16 & 0x1000) == 0)
  {
    goto LABEL_12;
  }
  *((unsigned char *)v5 + 141) = self->_protoOutgoing;
  *((_DWORD *)v5 + 38) |= 0x1000u;
  $FE257B6BB2BF625D40F79B47F1EB918B v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v16 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((unsigned char *)v5 + 143) = self->_protoShouldSuppressRingtone;
  *((_DWORD *)v5 + 38) |= 0x4000u;
  $FE257B6BB2BF625D40F79B47F1EB918B v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x800) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v16 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((unsigned char *)v5 + 140) = self->_protoNeedsManualInCallSounds;
  *((_DWORD *)v5 + 38) |= 0x800u;
  $FE257B6BB2BF625D40F79B47F1EB918B v16 = self->_has;
  if ((*(unsigned char *)&v16 & 0x10) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v16 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v5 + 25) = self->_protoSoundRegion;
  *((_DWORD *)v5 + 38) |= 0x10u;
  $FE257B6BB2BF625D40F79B47F1EB918B v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v16 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_51:
  *((unsigned char *)v5 + 137) = self->_protoEmergency;
  *((_DWORD *)v5 + 38) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_17:
    *((unsigned char *)v5 + 139) = self->_protoHasSentInvitation;
    *((_DWORD *)v5 + 38) |= 0x400u;
  }
LABEL_18:
  id v17 = [(CSDMessagingHandle *)self->_handle copyWithZone:a3];
  long long v18 = (void *)v5[5];
  v5[5] = v17;

  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *((unsigned char *)v5 + 142) = self->_protoSOS;
    *((_DWORD *)v5 + 38) |= 0x2000u;
  }
  id v19 = [(CSDMessagingCallProvider *)self->_protoProvider copyWithZone:a3];
  v20 = (void *)v5[11];
  v5[11] = v19;

  $FE257B6BB2BF625D40F79B47F1EB918B v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) != 0)
  {
    *((unsigned char *)v5 + 148) = self->_protoVideo;
    *((_DWORD *)v5 + 38) |= 0x80000u;
    $FE257B6BB2BF625D40F79B47F1EB918B v21 = self->_has;
  }
  if ((*(_DWORD *)&v21 & 0x40000) != 0)
  {
    *((unsigned char *)v5 + 147) = self->_protoUplinkMuted;
    *((_DWORD *)v5 + 38) |= 0x40000u;
  }
  id v22 = [(CSDMessagingCallModel *)self->_protoCallModel copyWithZone:a3];
  v23 = (void *)v5[9];
  v5[9] = v22;

  id v24 = [(NSString *)self->_localSenderIdentityUUIDString copyWithZone:a3];
  v25 = (void *)v5[8];
  v5[8] = v24;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v26 = self->_remoteParticipantHandles;
  id v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      id v30 = 0;
      do
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * (void)v30), "copyWithZone:", a3, (void)v41);
        [v5 addRemoteParticipantHandles:v31];

        id v30 = (char *)v30 + 1;
      }
      while (v28 != v30);
      id v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v28);
  }

  id v32 = [(NSString *)self->_localSenderIdentityAccountUUIDString copyWithZone:a3];
  v33 = (void *)v5[7];
  v5[7] = v32;

  $FE257B6BB2BF625D40F79B47F1EB918B v34 = self->_has;
  if ((*(unsigned char *)&v34 & 0x40) != 0)
  {
    *((_DWORD *)v5 + 27) = self->_protoTTYType;
    *((_DWORD *)v5 + 38) |= 0x40u;
    $FE257B6BB2BF625D40F79B47F1EB918B v34 = self->_has;
  }
  if ((*(_DWORD *)&v34 & 0x20000) != 0)
  {
    *((unsigned char *)v5 + 146) = self->_protoSupportsTTYWithVoice;
    *((_DWORD *)v5 + 38) |= 0x20000u;
  }
  id v35 = -[NSString copyWithZone:](self->_isoCountryCode, "copyWithZone:", a3, (void)v41);
  v36 = (void *)v5[6];
  v5[6] = v35;

  $FE257B6BB2BF625D40F79B47F1EB918B v37 = self->_has;
  if ((*(unsigned char *)&v37 & 4) != 0)
  {
    *((_DWORD *)v5 + 21) = self->_protoOriginatingUIType;
    *((_DWORD *)v5 + 38) |= 4u;
    $FE257B6BB2BF625D40F79B47F1EB918B v37 = self->_has;
    if ((*(_WORD *)&v37 & 0x200) == 0)
    {
LABEL_37:
      if ((*(_DWORD *)&v37 & 0x10000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&v37 & 0x200) == 0)
  {
    goto LABEL_37;
  }
  *((unsigned char *)v5 + 138) = self->_protoFailureExpected;
  *((_DWORD *)v5 + 38) |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_38:
    *((unsigned char *)v5 + 145) = self->_protoSupportsEmergencyFallback;
    *((_DWORD *)v5 + 38) |= 0x10000u;
  }
LABEL_39:
  id v38 = [(NSString *)self->_groupUUIDString copyWithZone:a3];
  $FE257B6BB2BF625D40F79B47F1EB918B v39 = (void *)v5[4];
  v5[4] = v38;

  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *((unsigned char *)v5 + 144) = self->_protoSupportsDTMFUpdates;
    *((_DWORD *)v5 + 38) |= 0x8000u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_181;
  }
  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  if ((unint64_t)uniqueProxyIdentifier | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](uniqueProxyIdentifier, "isEqual:")) {
      goto LABEL_181;
    }
  }
  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  int v7 = *((_DWORD *)v4 + 38);
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_protoStatus != *((_DWORD *)v4 + 26)) {
      goto LABEL_181;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_181;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_181;
    }
    if (self->_protoConferenced)
    {
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 136))
    {
      goto LABEL_181;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_181;
  }
  destinationID = self->_destinationID;
  if ((unint64_t)destinationID | *((void *)v4 + 3)
    && !-[NSString isEqual:](destinationID, "isEqual:"))
  {
    goto LABEL_181;
  }
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](sourceIdentifier, "isEqual:")) {
      goto LABEL_181;
    }
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v10 = self->_has;
  int v11 = *((_DWORD *)v4 + 38);
  if ((*(unsigned char *)&v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_protoService != *((_DWORD *)v4 + 24)) {
      goto LABEL_181;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_181;
  }
  if ((*(_DWORD *)&v10 & 0x200000) != 0)
  {
    if ((v11 & 0x200000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoWantsHoldMusic)
    {
      if (!*((unsigned char *)v4 + 150)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 150))
    {
      goto LABEL_181;
    }
  }
  else if ((v11 & 0x200000) != 0)
  {
    goto LABEL_181;
  }
  if ((*(unsigned char *)&v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_protoDisconnectedReason != *((_DWORD *)v4 + 20)) {
      goto LABEL_181;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_181;
  }
  if ((*(_DWORD *)&v10 & 0x100000) != 0)
  {
    if ((v11 & 0x100000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoVoicemail)
    {
      if (!*((unsigned char *)v4 + 149)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 149))
    {
      goto LABEL_181;
    }
  }
  else if ((v11 & 0x100000) != 0)
  {
    goto LABEL_181;
  }
  callerNameFromNetwork = self->_callerNameFromNetwork;
  if ((unint64_t)callerNameFromNetwork | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](callerNameFromNetwork, "isEqual:")) {
      goto LABEL_181;
    }
    $FE257B6BB2BF625D40F79B47F1EB918B v10 = self->_has;
  }
  int v13 = *((_DWORD *)v4 + 38);
  if (*(unsigned char *)&v10)
  {
    if ((v13 & 1) == 0 || self->_protoTimeConnected != *((double *)v4 + 1)) {
      goto LABEL_181;
    }
  }
  else if (v13)
  {
    goto LABEL_181;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    if ((v13 & 0x1000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoOutgoing)
    {
      if (!*((unsigned char *)v4 + 141)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 141))
    {
      goto LABEL_181;
    }
  }
  else if ((v13 & 0x1000) != 0)
  {
    goto LABEL_181;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v13 & 0x4000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoShouldSuppressRingtone)
    {
      if (!*((unsigned char *)v4 + 143)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 143))
    {
      goto LABEL_181;
    }
  }
  else if ((v13 & 0x4000) != 0)
  {
    goto LABEL_181;
  }
  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
    if ((v13 & 0x800) == 0) {
      goto LABEL_181;
    }
    if (self->_protoNeedsManualInCallSounds)
    {
      if (!*((unsigned char *)v4 + 140)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 140))
    {
      goto LABEL_181;
    }
  }
  else if ((v13 & 0x800) != 0)
  {
    goto LABEL_181;
  }
  if ((*(unsigned char *)&v10 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_protoSoundRegion != *((_DWORD *)v4 + 25)) {
      goto LABEL_181;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_181;
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v13 & 0x100) == 0) {
      goto LABEL_181;
    }
    if (self->_protoEmergency)
    {
      if (!*((unsigned char *)v4 + 137)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 137))
    {
      goto LABEL_181;
    }
  }
  else if ((v13 & 0x100) != 0)
  {
    goto LABEL_181;
  }
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0) {
      goto LABEL_181;
    }
    if (self->_protoHasSentInvitation)
    {
      if (!*((unsigned char *)v4 + 139)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 139))
    {
      goto LABEL_181;
    }
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_181;
  }
  handle = self->_handle;
  if ((unint64_t)handle | *((void *)v4 + 5))
  {
    if (!-[CSDMessagingHandle isEqual:](handle, "isEqual:")) {
      goto LABEL_181;
    }
    $FE257B6BB2BF625D40F79B47F1EB918B v10 = self->_has;
  }
  int v15 = *((_DWORD *)v4 + 38);
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoSOS)
    {
      if (!*((unsigned char *)v4 + 142)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 142))
    {
      goto LABEL_181;
    }
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_181;
  }
  protoProvider = self->_protoProvider;
  if ((unint64_t)protoProvider | *((void *)v4 + 11))
  {
    if (!-[CSDMessagingCallProvider isEqual:](protoProvider, "isEqual:")) {
      goto LABEL_181;
    }
    $FE257B6BB2BF625D40F79B47F1EB918B v10 = self->_has;
  }
  int v17 = *((_DWORD *)v4 + 38);
  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
    if ((v17 & 0x80000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoVideo)
    {
      if (!*((unsigned char *)v4 + 148)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 148))
    {
      goto LABEL_181;
    }
  }
  else if ((v17 & 0x80000) != 0)
  {
    goto LABEL_181;
  }
  if ((*(_DWORD *)&v10 & 0x40000) != 0)
  {
    if ((v17 & 0x40000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoUplinkMuted)
    {
      if (!*((unsigned char *)v4 + 147)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 147))
    {
      goto LABEL_181;
    }
  }
  else if ((v17 & 0x40000) != 0)
  {
    goto LABEL_181;
  }
  protoCallModel = self->_protoCallModel;
  if ((unint64_t)protoCallModel | *((void *)v4 + 9)
    && !-[CSDMessagingCallModel isEqual:](protoCallModel, "isEqual:"))
  {
    goto LABEL_181;
  }
  localSenderIdentityUUIDString = self->_localSenderIdentityUUIDString;
  if ((unint64_t)localSenderIdentityUUIDString | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](localSenderIdentityUUIDString, "isEqual:")) {
      goto LABEL_181;
    }
  }
  remoteParticipantHandles = self->_remoteParticipantHandles;
  if ((unint64_t)remoteParticipantHandles | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](remoteParticipantHandles, "isEqual:")) {
      goto LABEL_181;
    }
  }
  localSenderIdentityAccountUUIDString = self->_localSenderIdentityAccountUUIDString;
  if ((unint64_t)localSenderIdentityAccountUUIDString | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](localSenderIdentityAccountUUIDString, "isEqual:")) {
      goto LABEL_181;
    }
  }
  $FE257B6BB2BF625D40F79B47F1EB918B v22 = self->_has;
  int v23 = *((_DWORD *)v4 + 38);
  if ((*(unsigned char *)&v22 & 0x40) != 0)
  {
    if ((v23 & 0x40) == 0 || self->_protoTTYType != *((_DWORD *)v4 + 27)) {
      goto LABEL_181;
    }
  }
  else if ((v23 & 0x40) != 0)
  {
    goto LABEL_181;
  }
  if ((*(_DWORD *)&v22 & 0x20000) != 0)
  {
    if ((v23 & 0x20000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoSupportsTTYWithVoice)
    {
      if (!*((unsigned char *)v4 + 146)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 146))
    {
      goto LABEL_181;
    }
  }
  else if ((v23 & 0x20000) != 0)
  {
    goto LABEL_181;
  }
  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](isoCountryCode, "isEqual:")) {
      goto LABEL_181;
    }
    $FE257B6BB2BF625D40F79B47F1EB918B v22 = self->_has;
  }
  int v25 = *((_DWORD *)v4 + 38);
  if ((*(unsigned char *)&v22 & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_protoOriginatingUIType != *((_DWORD *)v4 + 21)) {
      goto LABEL_181;
    }
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_181;
  }
  if ((*(_WORD *)&v22 & 0x200) != 0)
  {
    if ((v25 & 0x200) == 0) {
      goto LABEL_181;
    }
    if (self->_protoFailureExpected)
    {
      if (!*((unsigned char *)v4 + 138)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 138))
    {
      goto LABEL_181;
    }
  }
  else if ((v25 & 0x200) != 0)
  {
    goto LABEL_181;
  }
  if ((*(_DWORD *)&v22 & 0x10000) != 0)
  {
    if ((v25 & 0x10000) == 0) {
      goto LABEL_181;
    }
    if (self->_protoSupportsEmergencyFallback)
    {
      if (!*((unsigned char *)v4 + 145)) {
        goto LABEL_181;
      }
    }
    else if (*((unsigned char *)v4 + 145))
    {
      goto LABEL_181;
    }
  }
  else if ((v25 & 0x10000) != 0)
  {
    goto LABEL_181;
  }
  groupUUIDString = self->_groupUUIDString;
  if ((unint64_t)groupUUIDString | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](groupUUIDString, "isEqual:")) {
      goto LABEL_181;
    }
    $FE257B6BB2BF625D40F79B47F1EB918B v22 = self->_has;
  }
  if ((*(_WORD *)&v22 & 0x8000) != 0)
  {
    if ((*((_DWORD *)v4 + 38) & 0x8000) != 0)
    {
      if (self->_protoSupportsDTMFUpdates)
      {
        if (!*((unsigned char *)v4 + 144)) {
          goto LABEL_181;
        }
      }
      else if (*((unsigned char *)v4 + 144))
      {
        goto LABEL_181;
      }
      BOOL v27 = 1;
      goto LABEL_182;
    }
LABEL_181:
    BOOL v27 = 0;
    goto LABEL_182;
  }
  BOOL v27 = (*((_DWORD *)v4 + 38) & 0x8000) == 0;
LABEL_182:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v48 = [(NSString *)self->_uniqueProxyIdentifier hash];
  $FE257B6BB2BF625D40F79B47F1EB918B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    uint64_t v47 = 2654435761 * self->_protoStatus;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v47 = 0;
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v46 = 2654435761 * self->_protoConferenced;
      goto LABEL_6;
    }
  }
  uint64_t v46 = 0;
LABEL_6:
  NSUInteger v45 = [(NSString *)self->_destinationID hash];
  NSUInteger v44 = [(NSString *)self->_sourceIdentifier hash];
  $FE257B6BB2BF625D40F79B47F1EB918B v4 = self->_has;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
    uint64_t v43 = 2654435761 * self->_protoService;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
    {
LABEL_8:
      uint64_t v42 = 2654435761 * self->_protoWantsHoldMusic;
      if ((*(unsigned char *)&v4 & 2) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v41 = 0;
      if ((*(_DWORD *)&v4 & 0x100000) != 0) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v43 = 0;
    if ((*(_DWORD *)&v4 & 0x200000) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v42 = 0;
  if ((*(unsigned char *)&v4 & 2) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v41 = 2654435761 * self->_protoDisconnectedReason;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_10:
    uint64_t v40 = 2654435761 * self->_protoVoicemail;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v40 = 0;
LABEL_15:
  NSUInteger v39 = [(NSString *)self->_callerNameFromNetwork hash];
  $FE257B6BB2BF625D40F79B47F1EB918B v5 = self->_has;
  if (*(unsigned char *)&v5)
  {
    double protoTimeConnected = self->_protoTimeConnected;
    double v8 = -protoTimeConnected;
    if (protoTimeConnected >= 0.0) {
      double v8 = self->_protoTimeConnected;
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
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
    uint64_t v37 = 2654435761 * self->_protoOutgoing;
    if ((*(_WORD *)&v5 & 0x4000) != 0)
    {
LABEL_25:
      uint64_t v36 = 2654435761 * self->_protoShouldSuppressRingtone;
      if ((*(_WORD *)&v5 & 0x800) != 0) {
        goto LABEL_26;
      }
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v37 = 0;
    if ((*(_WORD *)&v5 & 0x4000) != 0) {
      goto LABEL_25;
    }
  }
  uint64_t v36 = 0;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
LABEL_26:
    uint64_t v35 = 2654435761 * self->_protoNeedsManualInCallSounds;
    if ((*(unsigned char *)&v5 & 0x10) != 0) {
      goto LABEL_27;
    }
LABEL_32:
    uint64_t v34 = 0;
    if ((*(_WORD *)&v5 & 0x100) != 0) {
      goto LABEL_28;
    }
    goto LABEL_33;
  }
LABEL_31:
  uint64_t v35 = 0;
  if ((*(unsigned char *)&v5 & 0x10) == 0) {
    goto LABEL_32;
  }
LABEL_27:
  uint64_t v34 = 2654435761 * self->_protoSoundRegion;
  if ((*(_WORD *)&v5 & 0x100) != 0)
  {
LABEL_28:
    uint64_t v33 = 2654435761 * self->_protoEmergency;
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v33 = 0;
LABEL_34:
  unint64_t v38 = v6;
  if ((*(_WORD *)&v5 & 0x400) != 0) {
    uint64_t v32 = 2654435761 * self->_protoHasSentInvitation;
  }
  else {
    uint64_t v32 = 0;
  }
  unint64_t v31 = [(CSDMessagingHandle *)self->_handle hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    uint64_t v30 = 2654435761 * self->_protoSOS;
  }
  else {
    uint64_t v30 = 0;
  }
  unint64_t v29 = [(CSDMessagingCallProvider *)self->_protoProvider hash];
  $FE257B6BB2BF625D40F79B47F1EB918B v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
  {
    uint64_t v28 = 2654435761 * self->_protoVideo;
    if ((*(_DWORD *)&v11 & 0x40000) != 0) {
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((*(_DWORD *)&v11 & 0x40000) != 0)
    {
LABEL_42:
      uint64_t v27 = 2654435761 * self->_protoUplinkMuted;
      goto LABEL_45;
    }
  }
  uint64_t v27 = 0;
LABEL_45:
  unint64_t v26 = [(CSDMessagingCallModel *)self->_protoCallModel hash];
  NSUInteger v25 = [(NSString *)self->_localSenderIdentityUUIDString hash];
  unint64_t v24 = (unint64_t)[(NSMutableArray *)self->_remoteParticipantHandles hash];
  NSUInteger v12 = [(NSString *)self->_localSenderIdentityAccountUUIDString hash];
  $FE257B6BB2BF625D40F79B47F1EB918B v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
    uint64_t v14 = 2654435761 * self->_protoTTYType;
    if ((*(_DWORD *)&v13 & 0x20000) != 0) {
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(_DWORD *)&v13 & 0x20000) != 0)
    {
LABEL_47:
      uint64_t v15 = 2654435761 * self->_protoSupportsTTYWithVoice;
      goto LABEL_50;
    }
  }
  uint64_t v15 = 0;
LABEL_50:
  NSUInteger v16 = [(NSString *)self->_isoCountryCode hash];
  $FE257B6BB2BF625D40F79B47F1EB918B v17 = self->_has;
  if ((*(unsigned char *)&v17 & 4) == 0)
  {
    uint64_t v18 = 0;
    if ((*(_WORD *)&v17 & 0x200) != 0) {
      goto LABEL_52;
    }
LABEL_55:
    uint64_t v19 = 0;
    if ((*(_DWORD *)&v17 & 0x10000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_56;
  }
  uint64_t v18 = 2654435761 * self->_protoOriginatingUIType;
  if ((*(_WORD *)&v17 & 0x200) == 0) {
    goto LABEL_55;
  }
LABEL_52:
  uint64_t v19 = 2654435761 * self->_protoFailureExpected;
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
LABEL_53:
    uint64_t v20 = 2654435761 * self->_protoSupportsEmergencyFallback;
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v20 = 0;
LABEL_57:
  NSUInteger v21 = [(NSString *)self->_groupUUIDString hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    uint64_t v22 = 2654435761 * self->_protoSupportsDTMFUpdates;
  }
  else {
    uint64_t v22 = 0;
  }
  return v47 ^ v48 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v12 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 16)) {
    -[CSDMessagingCall setUniqueProxyIdentifier:](self, "setUniqueProxyIdentifier:");
  }
  int v5 = *((_DWORD *)v4 + 38);
  if ((v5 & 0x20) != 0)
  {
    self->_protoStatus = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x20u;
    int v5 = *((_DWORD *)v4 + 38);
  }
  if ((v5 & 0x80) != 0)
  {
    self->_protoConferenced = *((unsigned char *)v4 + 136);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 3)) {
    -[CSDMessagingCall setDestinationID:](self, "setDestinationID:");
  }
  if (*((void *)v4 + 15)) {
    -[CSDMessagingCall setSourceIdentifier:](self, "setSourceIdentifier:");
  }
  int v6 = *((_DWORD *)v4 + 38);
  if ((v6 & 8) != 0)
  {
    self->_protoService = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_has |= 8u;
    int v6 = *((_DWORD *)v4 + 38);
    if ((v6 & 0x200000) == 0)
    {
LABEL_13:
      if ((v6 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_31;
    }
  }
  else if ((v6 & 0x200000) == 0)
  {
    goto LABEL_13;
  }
  self->_protoWantsHoldMusic = *((unsigned char *)v4 + 150);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v6 = *((_DWORD *)v4 + 38);
  if ((v6 & 2) == 0)
  {
LABEL_14:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  self->_protoDisconnectedReason = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v4 + 38) & 0x100000) != 0)
  {
LABEL_15:
    self->_protoVoicemail = *((unsigned char *)v4 + 149);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_16:
  if (*((void *)v4 + 2)) {
    -[CSDMessagingCall setCallerNameFromNetwork:](self, "setCallerNameFromNetwork:");
  }
  int v7 = *((_DWORD *)v4 + 38);
  if (v7)
  {
    self->_double protoTimeConnected = *((double *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v7 = *((_DWORD *)v4 + 38);
    if ((v7 & 0x1000) == 0)
    {
LABEL_20:
      if ((v7 & 0x4000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_35;
    }
  }
  else if ((v7 & 0x1000) == 0)
  {
    goto LABEL_20;
  }
  self->_protoOutgoing = *((unsigned char *)v4 + 141);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 0x4000) == 0)
  {
LABEL_21:
    if ((v7 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_protoShouldSuppressRingtone = *((unsigned char *)v4 + 143);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 0x800) == 0)
  {
LABEL_22:
    if ((v7 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_protoNeedsManualInCallSounds = *((unsigned char *)v4 + 140);
  *(_DWORD *)&self->_has |= 0x800u;
  int v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 0x10) == 0)
  {
LABEL_23:
    if ((v7 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_protoSoundRegion = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x10u;
  int v7 = *((_DWORD *)v4 + 38);
  if ((v7 & 0x100) == 0)
  {
LABEL_24:
    if ((v7 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_38:
  self->_protoEmergency = *((unsigned char *)v4 + 137);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)v4 + 38) & 0x400) != 0)
  {
LABEL_25:
    self->_protoHasSentInvitation = *((unsigned char *)v4 + 139);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_26:
  handle = self->_handle;
  uint64_t v9 = *((void *)v4 + 5);
  if (handle)
  {
    if (v9) {
      -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[CSDMessagingCall setHandle:](self, "setHandle:");
  }
  if ((*((unsigned char *)v4 + 153) & 0x20) != 0)
  {
    self->_protoSOS = *((unsigned char *)v4 + 142);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  protoProvider = self->_protoProvider;
  uint64_t v11 = *((void *)v4 + 11);
  if (protoProvider)
  {
    if (v11) {
      -[CSDMessagingCallProvider mergeFrom:](protoProvider, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[CSDMessagingCall setProtoProvider:](self, "setProtoProvider:");
  }
  int v12 = *((_DWORD *)v4 + 38);
  if ((v12 & 0x80000) != 0)
  {
    self->_protoVideo = *((unsigned char *)v4 + 148);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v12 = *((_DWORD *)v4 + 38);
  }
  if ((v12 & 0x40000) != 0)
  {
    self->_protoUplinkMuted = *((unsigned char *)v4 + 147);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  protoCallModel = self->_protoCallModel;
  uint64_t v14 = *((void *)v4 + 9);
  if (protoCallModel)
  {
    if (v14) {
      -[CSDMessagingCallModel mergeFrom:](protoCallModel, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[CSDMessagingCall setProtoCallModel:](self, "setProtoCallModel:");
  }
  if (*((void *)v4 + 8)) {
    -[CSDMessagingCall setLocalSenderIdentityUUIDString:](self, "setLocalSenderIdentityUUIDString:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = *((id *)v4 + 14);
  id v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        -[CSDMessagingCall addRemoteParticipantHandles:](self, "addRemoteParticipantHandles:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
      }
      id v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  if (*((void *)v4 + 7)) {
    -[CSDMessagingCall setLocalSenderIdentityAccountUUIDString:](self, "setLocalSenderIdentityAccountUUIDString:");
  }
  int v20 = *((_DWORD *)v4 + 38);
  if ((v20 & 0x40) != 0)
  {
    self->_protoTTYType = *((_DWORD *)v4 + 27);
    *(_DWORD *)&self->_has |= 0x40u;
    int v20 = *((_DWORD *)v4 + 38);
  }
  if ((v20 & 0x20000) != 0)
  {
    self->_protoSupportsTTYWithVoice = *((unsigned char *)v4 + 146);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((void *)v4 + 6)) {
    -[CSDMessagingCall setIsoCountryCode:](self, "setIsoCountryCode:");
  }
  int v21 = *((_DWORD *)v4 + 38);
  if ((v21 & 4) != 0)
  {
    self->_protoOriginatingUIType = *((_DWORD *)v4 + 21);
    *(_DWORD *)&self->_has |= 4u;
    int v21 = *((_DWORD *)v4 + 38);
    if ((v21 & 0x200) == 0)
    {
LABEL_77:
      if ((v21 & 0x10000) == 0) {
        goto LABEL_79;
      }
      goto LABEL_78;
    }
  }
  else if ((v21 & 0x200) == 0)
  {
    goto LABEL_77;
  }
  self->_protoFailureExpected = *((unsigned char *)v4 + 138);
  *(_DWORD *)&self->_has |= 0x200u;
  if ((*((_DWORD *)v4 + 38) & 0x10000) != 0)
  {
LABEL_78:
    self->_protoSupportsEmergencyFallback = *((unsigned char *)v4 + 145);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
LABEL_79:
  if (*((void *)v4 + 4)) {
    -[CSDMessagingCall setGroupUUIDString:](self, "setGroupUUIDString:");
  }
  if ((*((unsigned char *)v4 + 153) & 0x80) != 0)
  {
    self->_protoSupportsDTMFUpdates = *((unsigned char *)v4 + 144);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
}

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (void)setUniqueProxyIdentifier:(id)a3
{
}

- (unsigned)protoStatus
{
  return self->_protoStatus;
}

- (BOOL)protoConferenced
{
  return self->_protoConferenced;
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

- (unsigned)protoService
{
  return self->_protoService;
}

- (BOOL)protoWantsHoldMusic
{
  return self->_protoWantsHoldMusic;
}

- (unsigned)protoDisconnectedReason
{
  return self->_protoDisconnectedReason;
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

- (double)protoTimeConnected
{
  return self->_protoTimeConnected;
}

- (BOOL)protoOutgoing
{
  return self->_protoOutgoing;
}

- (BOOL)protoShouldSuppressRingtone
{
  return self->_protoShouldSuppressRingtone;
}

- (BOOL)protoNeedsManualInCallSounds
{
  return self->_protoNeedsManualInCallSounds;
}

- (unsigned)protoSoundRegion
{
  return self->_protoSoundRegion;
}

- (BOOL)protoEmergency
{
  return self->_protoEmergency;
}

- (BOOL)protoHasSentInvitation
{
  return self->_protoHasSentInvitation;
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

- (CSDMessagingCallModel)protoCallModel
{
  return self->_protoCallModel;
}

- (void)setProtoCallModel:(id)a3
{
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

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
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

- (BOOL)protoSupportsDTMFUpdates
{
  return self->_protoSupportsDTMFUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueProxyIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_protoProvider, 0);
  objc_storeStrong((id *)&self->_protoCallModel, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUIDString, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityAccountUUIDString, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_groupUUIDString, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);

  objc_storeStrong((id *)&self->_callerNameFromNetwork, 0);
}

- (CSDMessagingCall)initWithCall:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDMessagingCall *)self init];
  if (v5)
  {
    int v6 = [v4 uniqueProxyIdentifier];
    [(CSDMessagingCall *)v5 setUniqueProxyIdentifier:v6];

    -[CSDMessagingCall setStatus:](v5, "setStatus:", [v4 status]);
    -[CSDMessagingCall setConferenced:](v5, "setConferenced:", [v4 isConferenced]);
    int v7 = [v4 handle];
    [(CSDMessagingCall *)v5 setTuHandle:v7];

    double v8 = [v4 sourceIdentifier];
    [(CSDMessagingCall *)v5 setSourceIdentifier:v8];

    uint64_t v9 = [v4 provider];
    [(CSDMessagingCall *)v5 setTuProvider:v9];

    -[CSDMessagingCall setVideo:](v5, "setVideo:", [v4 isVideo]);
    -[CSDMessagingCall setDisconnectedReason:](v5, "setDisconnectedReason:", [v4 disconnectedReason]);
    -[CSDMessagingCall setWantsHoldMusic:](v5, "setWantsHoldMusic:", [v4 wantsHoldMusic]);
    -[CSDMessagingCall setVoicemail:](v5, "setVoicemail:", [v4 isVoicemail]);
    double v10 = [v4 callerNameFromNetwork];
    [(CSDMessagingCall *)v5 setCallerNameFromNetwork:v10];

    uint64_t v11 = [v4 dateConnected];
    [(CSDMessagingCall *)v5 setDateConnected:v11];

    -[CSDMessagingCall setOutgoing:](v5, "setOutgoing:", [v4 isOutgoing]);
    -[CSDMessagingCall setShouldSuppressRingtone:](v5, "setShouldSuppressRingtone:", [v4 shouldSuppressRingtone]);
    -[CSDMessagingCall setNeedsManualInCallSounds:](v5, "setNeedsManualInCallSounds:", [v4 needsManualInCallSounds]);
    -[CSDMessagingCall setSoundRegion:](v5, "setSoundRegion:", [v4 soundRegion]);
    -[CSDMessagingCall setEmergency:](v5, "setEmergency:", [v4 isEmergency]);
    -[CSDMessagingCall setFailureExpected:](v5, "setFailureExpected:", [v4 isFailureExpected]);
    -[CSDMessagingCall setSupportsEmergencyFallback:](v5, "setSupportsEmergencyFallback:", [v4 supportsEmergencyFallback]);
    -[CSDMessagingCall setSOS:](v5, "setSOS:", [v4 isSOS]);
    -[CSDMessagingCall setSupportsDTMFUpdates:](v5, "setSupportsDTMFUpdates:", [v4 supportsDTMFUpdates]);
    -[CSDMessagingCall setHasSentInvitation:](v5, "setHasSentInvitation:", [v4 hasSentInvitation]);
    if ([v4 wantsHoldMusic]) {
      id v12 = 0;
    }
    else {
      id v12 = [v4 isUplinkMuted];
    }
    [(CSDMessagingCall *)v5 setUplinkMuted:v12];
    $FE257B6BB2BF625D40F79B47F1EB918B v13 = [v4 model];
    [(CSDMessagingCall *)v5 setCallModel:v13];

    uint64_t v14 = [v4 localSenderIdentityUUID];
    [(CSDMessagingCall *)v5 setLocalSenderIdentityUUID:v14];

    id v15 = [v4 localSenderIdentityAccountUUID];
    [(CSDMessagingCall *)v5 setLocalSenderIdentityAccountUUID:v15];

    id v16 = [v4 remoteParticipantHandles];
    [(CSDMessagingCall *)v5 setRemoteParticipantTUHandles:v16];

    -[CSDMessagingCall setTtyType:](v5, "setTtyType:", [v4 ttyType]);
    -[CSDMessagingCall setSupportsTTYWithVoice:](v5, "setSupportsTTYWithVoice:", [v4 supportsTTYWithVoice]);
    -[CSDMessagingCall setOriginatingUIType:](v5, "setOriginatingUIType:", [v4 originatingUIType]);
    id v17 = [v4 callGroupUUID];
    uint64_t v18 = [v17 UUIDString];
    [(CSDMessagingCall *)v5 setGroupUUIDString:v18];
  }
  return v5;
}

- (void)setStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingCall *)self protoStatus])
  {
    [(CSDMessagingCall *)self setProtoStatus:v3];
  }
}

- (void)setConferenced:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoConferenced])
  {
    [(CSDMessagingCall *)self setProtoConferenced:v3];
  }
}

- (void)setService:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingCall *)self protoService])
  {
    [(CSDMessagingCall *)self setProtoService:v3];
  }
}

- (void)setDisconnectedReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingCall *)self protoDisconnectedReason])
  {
    [(CSDMessagingCall *)self setProtoDisconnectedReason:v3];
  }
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoWantsHoldMusic])
  {
    [(CSDMessagingCall *)self setProtoWantsHoldMusic:v3];
  }
}

- (void)setVoicemail:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoVoicemail])
  {
    [(CSDMessagingCall *)self setProtoVoicemail:v3];
  }
}

- (void)setOutgoing:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoOutgoing])
  {
    [(CSDMessagingCall *)self setProtoOutgoing:v3];
  }
}

- (void)setShouldSuppressRingtone:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoShouldSuppressRingtone])
  {
    [(CSDMessagingCall *)self setProtoShouldSuppressRingtone:v3];
  }
}

- (void)setNeedsManualInCallSounds:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoNeedsManualInCallSounds])
  {
    [(CSDMessagingCall *)self setProtoNeedsManualInCallSounds:v3];
  }
}

- (void)setEmergency:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoEmergency])
  {
    [(CSDMessagingCall *)self setProtoEmergency:v3];
  }
}

- (void)setFailureExpected:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoFailureExpected])
  {
    [(CSDMessagingCall *)self setProtoFailureExpected:v3];
  }
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoSupportsEmergencyFallback])
  {
    [(CSDMessagingCall *)self setProtoSupportsEmergencyFallback:v3];
  }
}

- (void)setSOS:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoSOS])
  {
    [(CSDMessagingCall *)self setProtoSOS:v3];
  }
}

- (void)setSupportsDTMFUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoSupportsDTMFUpdates])
  {
    [(CSDMessagingCall *)self setProtoSupportsDTMFUpdates:v3];
  }
}

- (void)setHasSentInvitation:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoHasSentInvitation])
  {
    [(CSDMessagingCall *)self setProtoHasSentInvitation:v3];
  }
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoUplinkMuted])
  {
    [(CSDMessagingCall *)self setProtoUplinkMuted:v3];
  }
}

- (void)setTtyType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingCall *)self protoTTYType])
  {
    [(CSDMessagingCall *)self setProtoTTYType:v3];
  }
}

- (void)setSupportsTTYWithVoice:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || [(CSDMessagingCall *)self protoSupportsTTYWithVoice])
  {
    [(CSDMessagingCall *)self setProtoSupportsTTYWithVoice:v3];
  }
}

- (void)setOriginatingUIType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 || [(CSDMessagingCall *)self protoOriginatingUIType])
  {
    [(CSDMessagingCall *)self setProtoOriginatingUIType:v3];
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

- (void)updateRelayCall:(id)a3
{
  id v21 = a3;
  id v4 = [(CSDMessagingCall *)self tuProvider];

  if (v4)
  {
    int v5 = [(CSDMessagingCall *)self tuProvider];
    [v21 setProvider:v5];
  }
  objc_msgSend(v21, "setCallStatus:", -[CSDMessagingCall status](self, "status"));
  int v6 = [(CSDMessagingCall *)self handle];
  int v7 = [v6 tuHandle];
  [v21 setHandle:v7];

  double v8 = [(CSDMessagingCall *)self isoCountryCode];
  [v21 setIsoCountryCode:v8];

  uint64_t v9 = [(CSDMessagingCall *)self sourceIdentifier];
  [v21 setSourceIdentifier:v9];

  objc_msgSend(v21, "setDisconnectedReason:", -[CSDMessagingCall disconnectedReason](self, "disconnectedReason"));
  objc_msgSend(v21, "setWantsHoldMusic:", -[CSDMessagingCall wantsHoldMusic](self, "wantsHoldMusic"));
  objc_msgSend(v21, "setVoicemail:", -[CSDMessagingCall isVoicemail](self, "isVoicemail"));
  double v10 = [(CSDMessagingCall *)self callerNameFromNetwork];
  [v21 setCallerNameFromNetwork:v10];

  uint64_t v11 = [(CSDMessagingCall *)self dateConnected];
  [v21 setDateConnected:v11];

  objc_msgSend(v21, "setOutgoing:", -[CSDMessagingCall isOutgoing](self, "isOutgoing"));
  objc_msgSend(v21, "setVideo:", -[CSDMessagingCall isVideo](self, "isVideo"));
  objc_msgSend(v21, "setShouldSuppressRingtone:", -[CSDMessagingCall shouldSuppressRingtone](self, "shouldSuppressRingtone"));
  objc_msgSend(v21, "setNeedsManualInCallSounds:", -[CSDMessagingCall needsManualInCallSounds](self, "needsManualInCallSounds"));
  objc_msgSend(v21, "setSoundRegion:", -[CSDMessagingCall soundRegion](self, "soundRegion"));
  objc_msgSend(v21, "setEmergency:", -[CSDMessagingCall isEmergency](self, "isEmergency"));
  objc_msgSend(v21, "setFailureExpected:", -[CSDMessagingCall isFailureExpected](self, "isFailureExpected"));
  objc_msgSend(v21, "setSupportsEmergencyFallback:", -[CSDMessagingCall supportsEmergencyFallback](self, "supportsEmergencyFallback"));
  objc_msgSend(v21, "setSOS:", -[CSDMessagingCall isSOS](self, "isSOS"));
  objc_msgSend(v21, "setSupportsDTMFUpdates:", -[CSDMessagingCall supportsDTMFUpdates](self, "supportsDTMFUpdates"));
  objc_msgSend(v21, "setUplinkMuted:", -[CSDMessagingCall isUplinkMuted](self, "isUplinkMuted"));
  id v12 = [(CSDMessagingCall *)self localSenderIdentityUUID];
  [v21 setLocalSenderIdentityUUID:v12];

  $FE257B6BB2BF625D40F79B47F1EB918B v13 = [(CSDMessagingCall *)self localSenderIdentityAccountUUID];
  [v21 setLocalSenderIdentityAccountUUID:v13];

  uint64_t v14 = [(CSDMessagingCall *)self remoteParticipantTUHandles];
  [v21 setRemoteParticipantHandles:v14];

  objc_msgSend(v21, "setTtyType:", -[CSDMessagingCall ttyType](self, "ttyType"));
  objc_msgSend(v21, "setSupportsTTYWithVoice:", -[CSDMessagingCall supportsTTYWithVoice](self, "supportsTTYWithVoice"));
  objc_msgSend(v21, "setOriginatingUIType:", -[CSDMessagingCall originatingUIType](self, "originatingUIType"));
  id v15 = [(CSDMessagingCall *)self callModel];

  if (v15)
  {
    id v16 = [(CSDMessagingCall *)self callModel];
    [v21 setModel:v16];
  }
  if ([(CSDMessagingCall *)self hasSentInvitation]) {
    [v21 setLocallyHasSentInvitation];
  }
  if ([(CSDMessagingCall *)self hasGroupUUIDString]
    && (id v17 = objc_alloc((Class)NSUUID),
        [(CSDMessagingCall *)self groupUUIDString],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        id v19 = [v17 initWithUUIDString:v18],
        v18,
        v19))
  {
    [v21 setCallGroupUUID:v19];
    [v21 setConversation:1];
  }
  else if ([(CSDMessagingCall *)self isConferenced])
  {
    id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
    [v21 setCallGroupUUID:v20];
  }
  else
  {
    [v21 setCallGroupUUID:0];
  }
}

- (BOOL)isEqualToCall:(id)a3
{
  id v4 = a3;
  int v5 = [v4 uniqueProxyIdentifier];
  int v6 = [(CSDMessagingCall *)self uniqueProxyIdentifier];
  if (TUStringsAreEqualOrNil()
    && (unsigned int v7 = [v4 status], v7 == -[CSDMessagingCall status](self, "status"))
    && (unsigned int v8 = [v4 isConferenced],
        v8 == [(CSDMessagingCall *)self isConferenced]))
  {
    uint64_t v11 = [(CSDMessagingCall *)self tuHandle];
    id v12 = [v4 handle];
    if (TUObjectsAreEqualOrNil())
    {
      $FE257B6BB2BF625D40F79B47F1EB918B v13 = [v4 sourceIdentifier];
      uint64_t v14 = [(CSDMessagingCall *)self sourceIdentifier];
      if (TUStringsAreEqualOrNil())
      {
        id v15 = [(CSDMessagingCall *)self tuProvider];
        id v16 = [v4 provider];
        if (TUObjectsAreEqualOrNil())
        {
          NSUInteger v44 = v15;
          unsigned int v17 = [v4 isVideo];
          if (v17 == [(CSDMessagingCall *)self isVideo]
            && (unsigned int v18 = [v4 disconnectedReason],
                v18 == [(CSDMessagingCall *)self disconnectedReason])
            && (unsigned int v19 = [v4 wantsHoldMusic],
                v19 == [(CSDMessagingCall *)self wantsHoldMusic])
            && (unsigned int v20 = [v4 isVoicemail],
                v20 == [(CSDMessagingCall *)self isVoicemail]))
          {
            uint64_t v21 = [v4 callerNameFromNetwork];
            uint64_t v42 = [(CSDMessagingCall *)self callerNameFromNetwork];
            uint64_t v43 = (void *)v21;
            id v15 = v44;
            if (TUStringsAreEqualOrNil())
            {
              uint64_t v41 = [v4 dateConnected];
              long long v22 = [(CSDMessagingCall *)self dateConnected];
              if (v41 == v22)
              {
                id v40 = v22;
                unsigned int v23 = [v4 isOutgoing];
                if (v23 != [(CSDMessagingCall *)self isOutgoing]) {
                  goto LABEL_35;
                }
                unsigned int v24 = [v4 shouldSuppressRingtone];
                if (v24 != [(CSDMessagingCall *)self shouldSuppressRingtone]) {
                  goto LABEL_35;
                }
                unsigned int v25 = [v4 needsManualInCallSounds];
                if (v25 != [(CSDMessagingCall *)self needsManualInCallSounds]) {
                  goto LABEL_35;
                }
                id v26 = [v4 soundRegion];
                if (v26 != (id)[(CSDMessagingCall *)self soundRegion]) {
                  goto LABEL_35;
                }
                unsigned int v27 = [v4 isEmergency];
                if (v27 == [(CSDMessagingCall *)self isEmergency]
                  && (unsigned int v28 = [v4 isFailureExpected],
                      v28 == [(CSDMessagingCall *)self isFailureExpected])
                  && (unsigned int v29 = [v4 supportsEmergencyFallback],
                      v29 == [(CSDMessagingCall *)self supportsEmergencyFallback])
                  && (unsigned int v30 = [v4 isSOS], v30 == -[CSDMessagingCall isSOS](self, "isSOS"))
                  && (unsigned int v31 = [v4 supportsDTMFUpdates],
                      v31 == [(CSDMessagingCall *)self supportsDTMFUpdates])
                  && (unsigned int v32 = [v4 hasSentInvitation],
                      v32 == [(CSDMessagingCall *)self hasSentInvitation])
                  && (unsigned int v33 = [v4 isUplinkMuted],
                      v33 == [(CSDMessagingCall *)self isUplinkMuted]))
                {
                  uint64_t v34 = [v4 remoteParticipantHandles];
                  unint64_t v38 = [(CSDMessagingCall *)self remoteParticipantTUHandles];
                  NSUInteger v39 = v34;
                  if (objc_msgSend(v34, "isEqualToSet:")
                    && (unsigned int v35 = [v4 ttyType],
                        v35 == [(CSDMessagingCall *)self ttyType])
                    && (unsigned int v36 = [v4 supportsTTYWithVoice],
                        v36 == [(CSDMessagingCall *)self supportsTTYWithVoice]))
                  {
                    unsigned int v37 = [v4 originatingUIType];
                    BOOL v9 = v37 == [(CSDMessagingCall *)self originatingUIType];
                  }
                  else
                  {
                    BOOL v9 = 0;
                  }
                }
                else
                {
LABEL_35:
                  BOOL v9 = 0;
                }
                id v15 = v44;
                long long v22 = v40;
              }
              else
              {
                BOOL v9 = 0;
              }
            }
            else
            {
              BOOL v9 = 0;
            }
          }
          else
          {
            BOOL v9 = 0;
            id v15 = v44;
          }
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (TUCallModel)callModel
{
  id v3 = [(CSDMessagingCall *)self protoCallModel];

  if (v3)
  {
    id v3 = objc_alloc_init((Class)TUCallModel);
    id v4 = [(CSDMessagingCall *)self protoCallModel];
    objc_msgSend(v3, "setSupportsHolding:", objc_msgSend(v4, "supportsHolding"));

    int v5 = [(CSDMessagingCall *)self protoCallModel];
    objc_msgSend(v3, "setSupportsGrouping:", objc_msgSend(v5, "supportsGrouping"));

    int v6 = [(CSDMessagingCall *)self protoCallModel];
    objc_msgSend(v3, "setSupportsUngrouping:", objc_msgSend(v6, "supportsUngrouping"));

    unsigned int v7 = [(CSDMessagingCall *)self protoCallModel];
    objc_msgSend(v3, "setSupportsUnambiguousMultiPartyState:", objc_msgSend(v7, "supportsUnambiguousMultiPartyState"));

    unsigned int v8 = [(CSDMessagingCall *)self protoCallModel];
    objc_msgSend(v3, "setSupportsAddCall:", objc_msgSend(v8, "supportsAddCall"));

    BOOL v9 = [(CSDMessagingCall *)self protoCallModel];
    objc_msgSend(v3, "setSupportsSendingToVoicemail:", objc_msgSend(v9, "supportsSendingToVoicemail"));

    double v10 = [(CSDMessagingCall *)self protoCallModel];
    objc_msgSend(v3, "setSupportsDTMF:", objc_msgSend(v10, "supportsDTMF"));
  }

  return (TUCallModel *)v3;
}

- (void)setCallModel:(id)a3
{
  id v19 = a3;
  if (v19)
  {
    id v4 = objc_alloc_init(CSDMessagingCallModel);
    [(CSDMessagingCall *)self setProtoCallModel:v4];

    id v5 = [v19 supportsHolding];
    int v6 = [(CSDMessagingCall *)self protoCallModel];
    [v6 setSupportsHolding:v5];

    id v7 = [v19 supportsGrouping];
    unsigned int v8 = [(CSDMessagingCall *)self protoCallModel];
    [v8 setSupportsGrouping:v7];

    id v9 = [v19 supportsUngrouping];
    double v10 = [(CSDMessagingCall *)self protoCallModel];
    [v10 setSupportsUngrouping:v9];

    id v11 = [v19 supportsUnambiguousMultiPartyState];
    id v12 = [(CSDMessagingCall *)self protoCallModel];
    [v12 setSupportsUnambiguousMultiPartyState:v11];

    id v13 = [v19 supportsAddCall];
    uint64_t v14 = [(CSDMessagingCall *)self protoCallModel];
    [v14 setSupportsAddCall:v13];

    id v15 = [v19 supportsSendingToVoicemail];
    id v16 = [(CSDMessagingCall *)self protoCallModel];
    [v16 setSupportsSendingToVoicemail:v15];

    id v17 = [v19 supportsDTMF];
    unsigned int v18 = [(CSDMessagingCall *)self protoCallModel];
    [v18 setSupportsDTMF:v17];
  }
  else
  {
    [(CSDMessagingCall *)self setProtoCallModel:0];
  }
}

- (void)setTuHandle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 value];
  [(CSDMessagingCall *)self setDestinationID:v5];

  id v6 = +[CSDMessagingHandle handleWithTUHandle:v4];

  [(CSDMessagingCall *)self setHandle:v6];
}

- (TUHandle)tuHandle
{
  id v3 = [(CSDMessagingCall *)self handle];
  id v4 = [v3 tuHandle];

  if (!v4)
  {
    id v4 = [(CSDMessagingCall *)self destinationID];

    if (v4)
    {
      id v5 = [(CSDMessagingCall *)self destinationID];
      id v4 = +[TUHandle handleWithDestinationID:v5];
    }
  }

  return (TUHandle *)v4;
}

- (TUCallProvider)tuProvider
{
  id v3 = [(CSDMessagingCall *)self protoProvider];
  id v4 = [v3 provider];

  if (!v4)
  {
    char v7 = 0;
    id v5 = objc_alloc_init((Class)TUCallProviderManager);
    id v4 = objc_msgSend(v5, "providerWithService:video:", -[CSDMessagingCall service](self, "service"), &v7);
  }

  return (TUCallProvider *)v4;
}

- (void)setTuProvider:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v4 = [[CSDMessagingCallProvider alloc] initWithProvider:v5];
    [(CSDMessagingCall *)self setProtoProvider:v4];
    [(CSDMessagingCall *)self setService:+[TUCallProviderManager serviceForProvider:v5 video:[(CSDMessagingCall *)self isVideo]]];
  }
  else
  {
    [(CSDMessagingCall *)self setProtoProvider:0];
  }
}

- (BOOL)isVideo
{
  char v6 = 0;
  if ([(CSDMessagingCall *)self hasProtoVideo])
  {
    return [(CSDMessagingCall *)self protoVideo];
  }
  else
  {
    id v3 = objc_alloc_init((Class)TUCallProviderManager);
    id v4 = objc_msgSend(v3, "providerWithService:video:", -[CSDMessagingCall service](self, "service"), &v6);

    return v6 != 0;
  }
}

- (void)setVideo:(BOOL)a3
{
  BOOL v3 = a3;
  -[CSDMessagingCall setProtoVideo:](self, "setProtoVideo:");
  id v5 = [(CSDMessagingCall *)self tuProvider];
  [(CSDMessagingCall *)self setService:+[TUCallProviderManager serviceForProvider:v5 video:v3]];
}

- (void)setTuProvider:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v8)
  {
    char v6 = [[CSDMessagingCallProvider alloc] initWithProvider:v8];
    [(CSDMessagingCall *)self setProtoProvider:v6];
    char v7 = [(CSDMessagingCall *)self tuProvider];
    [(CSDMessagingCall *)self setService:+[TUCallProviderManager serviceForProvider:v7 video:v4]];
  }
  else
  {
    [(CSDMessagingCall *)self setProtoProvider:0];
  }
  [(CSDMessagingCall *)self setProtoVideo:v4];
}

- (NSDate)dateConnected
{
  [(CSDMessagingCall *)self protoTimeConnected];
  if (v3 <= 0.0)
  {
    BOOL v4 = 0;
  }
  else
  {
    [(CSDMessagingCall *)self protoTimeConnected];
    BOOL v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }

  return (NSDate *)v4;
}

- (void)setDateConnected:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];

  -[CSDMessagingCall setProtoTimeConnected:](self, "setProtoTimeConnected:");
}

- (NSUUID)localSenderIdentityUUID
{
  double v3 = [(CSDMessagingCall *)self localSenderIdentityUUIDString];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    id v5 = [(CSDMessagingCall *)self localSenderIdentityUUIDString];
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
  [(CSDMessagingCall *)self setLocalSenderIdentityUUIDString:v4];
}

- (NSUUID)localSenderIdentityAccountUUID
{
  double v3 = [(CSDMessagingCall *)self localSenderIdentityAccountUUIDString];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    id v5 = [(CSDMessagingCall *)self localSenderIdentityAccountUUIDString];
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
  [(CSDMessagingCall *)self setLocalSenderIdentityAccountUUIDString:v4];
}

- (NSSet)remoteParticipantTUHandles
{
  double v3 = [(CSDMessagingCall *)self remoteParticipantHandles];
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CSDMessagingCall *)self remoteParticipantHandles];
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
        double v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) tuHandle];
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
        id v9 = +[CSDMessagingHandle handleWithTUHandle:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        if (v9) {
          [(CSDMessagingCall *)self addRemoteParticipantHandles:v9];
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

@end