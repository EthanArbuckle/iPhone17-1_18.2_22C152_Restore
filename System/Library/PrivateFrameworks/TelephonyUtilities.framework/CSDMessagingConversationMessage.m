@interface CSDMessagingConversationMessage
+ (Class)activeLightweightParticipantsType;
+ (Class)activeParticipantsType;
+ (Class)activitySessionsType;
+ (Class)addedMembersType;
+ (Class)invitationPreferencesType;
+ (Class)lightweightMembersType;
+ (Class)removedMembersType;
- (BOOL)constitutesLetMeInApproval;
- (BOOL)guestModeEnabled;
- (BOOL)hasAvMode;
- (BOOL)hasConversationGroupUUIDString;
- (BOOL)hasDisconnectedReason;
- (BOOL)hasEnclosedEncryptedType;
- (BOOL)hasEncryptedMessage;
- (BOOL)hasGuestModeEnabled;
- (BOOL)hasHighlightIdentifier;
- (BOOL)hasIsLetMeInApproved;
- (BOOL)hasJoinedMetadata;
- (BOOL)hasLetMeInDelegationHandle;
- (BOOL)hasLetMeInDelegationUUID;
- (BOOL)hasLink;
- (BOOL)hasNickname;
- (BOOL)hasPresentationMode;
- (BOOL)hasProtoUpgradeSessionUUID;
- (BOOL)hasReportData;
- (BOOL)hasRequestBlobRecoveryOptions;
- (BOOL)hasScreenShareContext;
- (BOOL)hasShouldSuppressInCallUI;
- (BOOL)hasStagedActivitySession;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLetMeInApproved;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldSuppressInCallUI;
- (CSDMessagingConversationActivitySession)stagedActivitySession;
- (CSDMessagingConversationJoinedMetadata)joinedMetadata;
- (CSDMessagingConversationLink)link;
- (CSDMessagingConversationMessage)initWithEncryptedMessage:(id)a3 enclosedType:(int)a4 link:(id)a5;
- (CSDMessagingConversationMessage)initWithType:(int)a3 groupUUID:(id)a4 link:(id)a5;
- (CSDMessagingConversationReport)reportData;
- (CSDMessagingEncryptedConversationMessage)encryptedMessage;
- (CSDMessagingScreenShareContext)screenShareContext;
- (NSMutableArray)activeLightweightParticipants;
- (NSMutableArray)activeParticipants;
- (NSMutableArray)activitySessions;
- (NSMutableArray)addedMembers;
- (NSMutableArray)invitationPreferences;
- (NSMutableArray)lightweightMembers;
- (NSMutableArray)removedMembers;
- (NSSet)tuInvitationPreferences;
- (NSString)conversationGroupUUIDString;
- (NSString)highlightIdentifier;
- (NSString)letMeInDelegationHandle;
- (NSString)letMeInDelegationUUID;
- (NSString)nickname;
- (NSString)protoUpgradeSessionUUID;
- (NSUUID)conversationGroupUUID;
- (TUConversationLink)tuConversationLink;
- (id)activeLightweightParticipantsAtIndex:(unint64_t)a3;
- (id)activeParticipantsAtIndex:(unint64_t)a3;
- (id)activitySessionsAtIndex:(unint64_t)a3;
- (id)addedMembersAtIndex:(unint64_t)a3;
- (id)avModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enclosedEncryptedTypeAsString:(int)a3;
- (id)invitationPreferencesAtIndex:(unint64_t)a3;
- (id)lightweightMembersAtIndex:(unint64_t)a3;
- (id)presentationModeAsString:(int)a3;
- (id)removedMembersAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsAvMode:(id)a3;
- (int)StringAsEnclosedEncryptedType:(id)a3;
- (int)StringAsPresentationMode:(id)a3;
- (int)StringAsType:(id)a3;
- (int)avMode;
- (int)enclosedEncryptedType;
- (int)presentationMode;
- (int)requestBlobRecoveryOptions;
- (int)type;
- (unint64_t)activeLightweightParticipantsCount;
- (unint64_t)activeParticipantsCount;
- (unint64_t)activitySessionsCount;
- (unint64_t)addedMembersCount;
- (unint64_t)hash;
- (unint64_t)invitationPreferencesCount;
- (unint64_t)lightweightMembersCount;
- (unint64_t)removedMembersCount;
- (unint64_t)resolvedPresentationMode;
- (unsigned)disconnectedReason;
- (unsigned)version;
- (void)addActiveLightweightParticipants:(id)a3;
- (void)addActiveParticipants:(id)a3;
- (void)addActivitySessions:(id)a3;
- (void)addAddedMembers:(id)a3;
- (void)addInvitationPreferences:(id)a3;
- (void)addLightweightMembers:(id)a3;
- (void)addRemovedMembers:(id)a3;
- (void)clearActiveLightweightParticipants;
- (void)clearActiveParticipants;
- (void)clearActivitySessions;
- (void)clearAddedMembers;
- (void)clearInvitationPreferences;
- (void)clearLightweightMembers;
- (void)clearRemovedMembers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveLightweightParticipants:(id)a3;
- (void)setActiveParticipants:(id)a3;
- (void)setActivitySessions:(id)a3;
- (void)setAddedMembers:(id)a3;
- (void)setAvMode:(int)a3;
- (void)setConversationGroupUUID:(id)a3;
- (void)setConversationGroupUUIDString:(id)a3;
- (void)setDisconnectedReason:(unsigned int)a3;
- (void)setEnclosedEncryptedType:(int)a3;
- (void)setEncryptedMessage:(id)a3;
- (void)setGuestModeEnabled:(BOOL)a3;
- (void)setHasAvMode:(BOOL)a3;
- (void)setHasDisconnectedReason:(BOOL)a3;
- (void)setHasEnclosedEncryptedType:(BOOL)a3;
- (void)setHasGuestModeEnabled:(BOOL)a3;
- (void)setHasIsLetMeInApproved:(BOOL)a3;
- (void)setHasPresentationMode:(BOOL)a3;
- (void)setHasRequestBlobRecoveryOptions:(BOOL)a3;
- (void)setHasShouldSuppressInCallUI:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHighlightIdentifier:(id)a3;
- (void)setInvitationPreferences:(id)a3;
- (void)setIsLetMeInApproved:(BOOL)a3;
- (void)setJoinedMetadata:(id)a3;
- (void)setLetMeInDelegationHandle:(id)a3;
- (void)setLetMeInDelegationUUID:(id)a3;
- (void)setLightweightMembers:(id)a3;
- (void)setLink:(id)a3;
- (void)setNickname:(id)a3;
- (void)setPresentationMode:(int)a3;
- (void)setProtoUpgradeSessionUUID:(id)a3;
- (void)setRemovedMembers:(id)a3;
- (void)setReportData:(id)a3;
- (void)setRequestBlobRecoveryOptions:(int)a3;
- (void)setScreenShareContext:(id)a3;
- (void)setShouldSuppressInCallUI:(BOOL)a3;
- (void)setStagedActivitySession:(id)a3;
- (void)setTUInvitationPreferences:(id)a3;
- (void)setType:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationMessage

- (CSDMessagingConversationMessage)initWithType:(int)a3 groupUUID:(id)a4 link:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(CSDMessagingConversationMessage *)self init];
  [(CSDMessagingConversationMessage *)v10 setType:v6];
  if (v8) {
    [(CSDMessagingConversationMessage *)v10 setConversationGroupUUID:v8];
  }
  if (v9)
  {
    v11 = +[CSDMessagingConversationLink linkWithTUConversationLink:v9 includeGroupUUID:1];
    [(CSDMessagingConversationMessage *)v10 setLink:v11];
  }
  return v10;
}

- (CSDMessagingConversationMessage)initWithEncryptedMessage:(id)a3 enclosedType:(int)a4 link:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(CSDMessagingConversationMessage *)self init];
  [(CSDMessagingConversationMessage *)v10 setType:13];
  [(CSDMessagingConversationMessage *)v10 setEncryptedMessage:v9];

  [(CSDMessagingConversationMessage *)v10 setEnclosedEncryptedType:v5];
  if (v8)
  {
    v11 = +[CSDMessagingConversationLink linkWithTUConversationLink:v8 includeGroupUUID:0];
    [(CSDMessagingConversationMessage *)v10 setLink:v11];
  }
  return v10;
}

- (BOOL)constitutesLetMeInApproval
{
  if (![(CSDMessagingConversationMessage *)self hasType]
    || [(CSDMessagingConversationMessage *)self type] != 16
    || ![(CSDMessagingConversationMessage *)self hasIsLetMeInApproved])
  {
    return 0;
  }

  return [(CSDMessagingConversationMessage *)self isLetMeInApproved];
}

- (TUConversationLink)tuConversationLink
{
  if ([(CSDMessagingConversationMessage *)self hasLink])
  {
    v3 = [(CSDMessagingConversationMessage *)self link];
    v4 = [v3 tuConversationLink];
  }
  else
  {
    v4 = 0;
  }

  return (TUConversationLink *)v4;
}

- (unint64_t)resolvedPresentationMode
{
  if (![(CSDMessagingConversationMessage *)self hasPresentationMode]) {
    return [(CSDMessagingConversationMessage *)self avMode] == 0;
  }
  unsigned int v3 = [(CSDMessagingConversationMessage *)self presentationMode];
  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (NSSet)tuInvitationPreferences
{
  unsigned int v3 = +[NSMutableSet set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(CSDMessagingConversationMessage *)self invitationPreferences];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) tuInvitationPreference];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return (NSSet *)v10;
}

- (NSUUID)conversationGroupUUID
{
  unsigned int v3 = [(CSDMessagingConversationMessage *)self conversationGroupUUIDString];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    id v5 = [(CSDMessagingConversationMessage *)self conversationGroupUUIDString];
    id v6 = [v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setConversationGroupUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(CSDMessagingConversationMessage *)self setConversationGroupUUIDString:v4];
}

- (void)setTUInvitationPreferences:(id)a3
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
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = +[CSDMessagingConversationInvitationPreference invitationPreferenceWithTUConversationInvitationPreference:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        [(CSDMessagingConversationMessage *)self addInvitationPreferences:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasVersion
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)type
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)typeAsString:(int)a3
{
  if a3 < 0x25 && ((0x1FFFE9FF7FuLL >> a3))
  {
    __int16 v3 = off_100509910[a3];
  }
  else
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Invitation"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Upgrade"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AddMember"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BlobRecoveryRequest"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BlobRecoveryResponse"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RespondedElsewhere"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AddActivitySession"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Decline"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LetMeInRequest"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LinkCreated"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NicknameUpdated"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"EncryptedConversationMessage"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"LetMeInDelegation"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"LetMeInDelegationResponse"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"LetMeInResponse"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"RemoveMember"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"RemoveActivitySession"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"RequestVideoUpgrade"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"UpdateActivity"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"LinkInvalidated"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"AddLightweightMember"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"LinkChanged"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"UpdateActivityImage"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"GuestModeUpdated"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"Endorse"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"AddHighlight"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"RemoveHighlight"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"UpdateJoinedMetadata"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"ParticipantUpdated"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"RegisterMessagesGroupUUID"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"ScreenShareRequest"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ScreenShareResponse"])
  {
    int v4 = 36;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_shouldSuppressInCallUI = a3;
}

- (void)setHasShouldSuppressInCallUI:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasShouldSuppressInCallUI
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearActiveParticipants
{
}

- (void)addActiveParticipants:(id)a3
{
  id v4 = a3;
  activeParticipants = self->_activeParticipants;
  id v8 = v4;
  if (!activeParticipants)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_activeParticipants;
    self->_activeParticipants = v6;

    id v4 = v8;
    activeParticipants = self->_activeParticipants;
  }
  [(NSMutableArray *)activeParticipants addObject:v4];
}

- (unint64_t)activeParticipantsCount
{
  return (unint64_t)[(NSMutableArray *)self->_activeParticipants count];
}

- (id)activeParticipantsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_activeParticipants objectAtIndex:a3];
}

+ (Class)activeParticipantsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasConversationGroupUUIDString
{
  return self->_conversationGroupUUIDString != 0;
}

- (void)clearAddedMembers
{
}

- (void)addAddedMembers:(id)a3
{
  id v4 = a3;
  addedMembers = self->_addedMembers;
  id v8 = v4;
  if (!addedMembers)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_addedMembers;
    self->_addedMembers = v6;

    id v4 = v8;
    addedMembers = self->_addedMembers;
  }
  [(NSMutableArray *)addedMembers addObject:v4];
}

- (unint64_t)addedMembersCount
{
  return (unint64_t)[(NSMutableArray *)self->_addedMembers count];
}

- (id)addedMembersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_addedMembers objectAtIndex:a3];
}

+ (Class)addedMembersType
{
  return (Class)objc_opt_class();
}

- (void)setDisconnectedReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_disconnectedReason = a3;
}

- (void)setHasDisconnectedReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDisconnectedReason
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasProtoUpgradeSessionUUID
{
  return self->_protoUpgradeSessionUUID != 0;
}

- (void)clearActivitySessions
{
}

- (void)addActivitySessions:(id)a3
{
  id v4 = a3;
  activitySessions = self->_activitySessions;
  id v8 = v4;
  if (!activitySessions)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_activitySessions;
    self->_activitySessions = v6;

    id v4 = v8;
    activitySessions = self->_activitySessions;
  }
  [(NSMutableArray *)activitySessions addObject:v4];
}

- (unint64_t)activitySessionsCount
{
  return (unint64_t)[(NSMutableArray *)self->_activitySessions count];
}

- (id)activitySessionsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_activitySessions objectAtIndex:a3];
}

+ (Class)activitySessionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (BOOL)hasLink
{
  return self->_link != 0;
}

- (BOOL)hasReportData
{
  return self->_reportData != 0;
}

- (void)setIsLetMeInApproved:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isLetMeInApproved = a3;
}

- (void)setHasIsLetMeInApproved:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsLetMeInApproved
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasEncryptedMessage
{
  return self->_encryptedMessage != 0;
}

- (BOOL)hasLetMeInDelegationHandle
{
  return self->_letMeInDelegationHandle != 0;
}

- (BOOL)hasLetMeInDelegationUUID
{
  return self->_letMeInDelegationUUID != 0;
}

- (int)enclosedEncryptedType
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_enclosedEncryptedType;
  }
  else {
    return 0;
  }
}

- (void)setEnclosedEncryptedType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_enclosedEncryptedType = a3;
}

- (void)setHasEnclosedEncryptedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEnclosedEncryptedType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)enclosedEncryptedTypeAsString:(int)a3
{
  if a3 < 0x25 && ((0x1FFFE9FF7FuLL >> a3))
  {
    __int16 v3 = off_100509910[a3];
  }
  else
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsEnclosedEncryptedType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Invitation"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Upgrade"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AddMember"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BlobRecoveryRequest"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BlobRecoveryResponse"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RespondedElsewhere"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AddActivitySession"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Decline"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LetMeInRequest"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LinkCreated"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NicknameUpdated"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"EncryptedConversationMessage"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"LetMeInDelegation"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"LetMeInDelegationResponse"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"LetMeInResponse"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"RemoveMember"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"RemoveActivitySession"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"RequestVideoUpgrade"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"UpdateActivity"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"LinkInvalidated"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"AddLightweightMember"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"LinkChanged"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"UpdateActivityImage"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"GuestModeUpdated"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"Endorse"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"AddHighlight"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"RemoveHighlight"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"UpdateJoinedMetadata"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"ParticipantUpdated"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"RegisterMessagesGroupUUID"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"ScreenShareRequest"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ScreenShareResponse"])
  {
    int v4 = 36;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearInvitationPreferences
{
}

- (void)addInvitationPreferences:(id)a3
{
  id v4 = a3;
  invitationPreferences = self->_invitationPreferences;
  id v8 = v4;
  if (!invitationPreferences)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_invitationPreferences;
    self->_invitationPreferences = v6;

    id v4 = v8;
    invitationPreferences = self->_invitationPreferences;
  }
  [(NSMutableArray *)invitationPreferences addObject:v4];
}

- (unint64_t)invitationPreferencesCount
{
  return (unint64_t)[(NSMutableArray *)self->_invitationPreferences count];
}

- (id)invitationPreferencesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_invitationPreferences objectAtIndex:a3];
}

+ (Class)invitationPreferencesType
{
  return (Class)objc_opt_class();
}

- (void)clearRemovedMembers
{
}

- (void)addRemovedMembers:(id)a3
{
  id v4 = a3;
  removedMembers = self->_removedMembers;
  id v8 = v4;
  if (!removedMembers)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_removedMembers;
    self->_removedMembers = v6;

    id v4 = v8;
    removedMembers = self->_removedMembers;
  }
  [(NSMutableArray *)removedMembers addObject:v4];
}

- (unint64_t)removedMembersCount
{
  return (unint64_t)[(NSMutableArray *)self->_removedMembers count];
}

- (id)removedMembersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_removedMembers objectAtIndex:a3];
}

+ (Class)removedMembersType
{
  return (Class)objc_opt_class();
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
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_lightweightMembers;
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

- (void)clearActiveLightweightParticipants
{
}

- (void)addActiveLightweightParticipants:(id)a3
{
  id v4 = a3;
  activeLightweightParticipants = self->_activeLightweightParticipants;
  id v8 = v4;
  if (!activeLightweightParticipants)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_activeLightweightParticipants;
    self->_activeLightweightParticipants = v6;

    id v4 = v8;
    activeLightweightParticipants = self->_activeLightweightParticipants;
  }
  [(NSMutableArray *)activeLightweightParticipants addObject:v4];
}

- (unint64_t)activeLightweightParticipantsCount
{
  return (unint64_t)[(NSMutableArray *)self->_activeLightweightParticipants count];
}

- (id)activeLightweightParticipantsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_activeLightweightParticipants objectAtIndex:a3];
}

+ (Class)activeLightweightParticipantsType
{
  return (Class)objc_opt_class();
}

- (void)setGuestModeEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_guestModeEnabled = a3;
}

- (void)setHasGuestModeEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGuestModeEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasHighlightIdentifier
{
  return self->_highlightIdentifier != 0;
}

- (BOOL)hasJoinedMetadata
{
  return self->_joinedMetadata != 0;
}

- (BOOL)hasStagedActivitySession
{
  return self->_stagedActivitySession != 0;
}

- (int)avMode
{
  if (*(_WORD *)&self->_has) {
    return self->_avMode;
  }
  else {
    return 0;
  }
}

- (void)setAvMode:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_avMode = a3;
}

- (void)setHasAvMode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAvMode
{
  return *(_WORD *)&self->_has & 1;
}

- (id)avModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = off_100509A38[a3];
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

- (void)setRequestBlobRecoveryOptions:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_requestBlobRecoveryOptions = a3;
}

- (void)setHasRequestBlobRecoveryOptions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRequestBlobRecoveryOptions
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasScreenShareContext
{
  return self->_screenShareContext != 0;
}

- (int)presentationMode
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_presentationMode;
  }
  else {
    return 0;
  }
}

- (void)setPresentationMode:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_presentationMode = a3;
}

- (void)setHasPresentationMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPresentationMode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)presentationModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = off_100509A50[a3];
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationMessage;
  id v3 = [(CSDMessagingConversationMessage *)&v7 description];
  int v4 = [(CSDMessagingConversationMessage *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v42 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v42 forKey:@"version"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  unsigned int type = self->_type;
  if (type < 0x25 && ((0x1FFFE9FF7FuLL >> type) & 1) != 0)
  {
    v44 = off_100509910[type];
  }
  else
  {
    v44 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
  }
  [v3 setObject:v44 forKey:@"type"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    id v5 = +[NSNumber numberWithBool:self->_shouldSuppressInCallUI];
    [v3 setObject:v5 forKey:@"shouldSuppressInCallUI"];
  }
LABEL_5:
  if ([(NSMutableArray *)self->_activeParticipants count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_activeParticipants, "count"));
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    objc_super v7 = self->_activeParticipants;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v113 objects:v123 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v114;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v114 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v113 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v113 objects:v123 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"activeParticipants"];
  }
  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if (conversationGroupUUIDString) {
    [v3 setObject:conversationGroupUUIDString forKey:@"conversationGroupUUIDString"];
  }
  if ([(NSMutableArray *)self->_addedMembers count])
  {
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_addedMembers, "count"));
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v15 = self->_addedMembers;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v109 objects:v122 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v110;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v110 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v109 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v109 objects:v122 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"addedMembers"];
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v21 = +[NSNumber numberWithUnsignedInt:self->_disconnectedReason];
    [v3 setObject:v21 forKey:@"disconnectedReason"];
  }
  protoUpgradeSessionUUID = self->_protoUpgradeSessionUUID;
  if (protoUpgradeSessionUUID) {
    [v3 setObject:protoUpgradeSessionUUID forKey:@"protoUpgradeSessionUUID"];
  }
  if ([(NSMutableArray *)self->_activitySessions count])
  {
    id v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_activitySessions, "count"));
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    v24 = self->_activitySessions;
    id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v105 objects:v121 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v106;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v106 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v105 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v23 addObject:v29];
        }
        id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v105 objects:v121 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKey:@"activitySessions"];
  }
  nickname = self->_nickname;
  if (nickname) {
    [v3 setObject:nickname forKey:@"nickname"];
  }
  link = self->_link;
  if (link)
  {
    v32 = [(CSDMessagingConversationLink *)link dictionaryRepresentation];
    [v3 setObject:v32 forKey:@"link"];
  }
  reportData = self->_reportData;
  if (reportData)
  {
    v34 = [(CSDMessagingConversationReport *)reportData dictionaryRepresentation];
    [v3 setObject:v34 forKey:@"reportData"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v35 = +[NSNumber numberWithBool:self->_isLetMeInApproved];
    [v3 setObject:v35 forKey:@"isLetMeInApproved"];
  }
  encryptedMessage = self->_encryptedMessage;
  if (encryptedMessage)
  {
    v37 = [(CSDMessagingEncryptedConversationMessage *)encryptedMessage dictionaryRepresentation];
    [v3 setObject:v37 forKey:@"encryptedMessage"];
  }
  letMeInDelegationHandle = self->_letMeInDelegationHandle;
  if (letMeInDelegationHandle) {
    [v3 setObject:letMeInDelegationHandle forKey:@"letMeInDelegationHandle"];
  }
  letMeInDelegationUUID = self->_letMeInDelegationUUID;
  if (letMeInDelegationUUID) {
    [v3 setObject:letMeInDelegationUUID forKey:@"letMeInDelegationUUID"];
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    unsigned int enclosedEncryptedType = self->_enclosedEncryptedType;
    if (enclosedEncryptedType < 0x25 && ((0x1FFFE9FF7FuLL >> enclosedEncryptedType) & 1) != 0)
    {
      v41 = off_100509910[enclosedEncryptedType];
    }
    else
    {
      v41 = +[NSString stringWithFormat:@"(unknown: %i)", self->_enclosedEncryptedType];
    }
    [v3 setObject:v41 forKey:@"enclosedEncryptedType"];
  }
  if ([(NSMutableArray *)self->_invitationPreferences count])
  {
    id v45 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_invitationPreferences, "count"));
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v46 = self->_invitationPreferences;
    id v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v101 objects:v120 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v102;
      do
      {
        for (m = 0; m != v48; m = (char *)m + 1)
        {
          if (*(void *)v102 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = [*(id *)(*((void *)&v101 + 1) + 8 * (void)m) dictionaryRepresentation];
          [v45 addObject:v51];
        }
        id v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v101 objects:v120 count:16];
      }
      while (v48);
    }

    [v3 setObject:v45 forKey:@"invitationPreferences"];
  }
  if ([(NSMutableArray *)self->_removedMembers count])
  {
    id v52 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_removedMembers, "count"));
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    v53 = self->_removedMembers;
    id v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v97 objects:v119 count:16];
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v98;
      do
      {
        for (n = 0; n != v55; n = (char *)n + 1)
        {
          if (*(void *)v98 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = [*(id *)(*((void *)&v97 + 1) + 8 * (void)n) dictionaryRepresentation];
          [v52 addObject:v58];
        }
        id v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v97 objects:v119 count:16];
      }
      while (v55);
    }

    [v3 setObject:v52 forKey:@"removedMembers"];
  }
  if ([(NSMutableArray *)self->_lightweightMembers count])
  {
    id v59 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_lightweightMembers, "count"));
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v60 = self->_lightweightMembers;
    id v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v93 objects:v118 count:16];
    if (v61)
    {
      id v62 = v61;
      uint64_t v63 = *(void *)v94;
      do
      {
        for (ii = 0; ii != v62; ii = (char *)ii + 1)
        {
          if (*(void *)v94 != v63) {
            objc_enumerationMutation(v60);
          }
          v65 = [*(id *)(*((void *)&v93 + 1) + 8 * (void)ii) dictionaryRepresentation];
          [v59 addObject:v65];
        }
        id v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v93 objects:v118 count:16];
      }
      while (v62);
    }

    [v3 setObject:v59 forKey:@"lightweightMembers"];
  }
  if ([(NSMutableArray *)self->_activeLightweightParticipants count])
  {
    id v66 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_activeLightweightParticipants, "count"));
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v67 = self->_activeLightweightParticipants;
    id v68 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v89 objects:v117 count:16];
    if (v68)
    {
      id v69 = v68;
      uint64_t v70 = *(void *)v90;
      do
      {
        for (jj = 0; jj != v69; jj = (char *)jj + 1)
        {
          if (*(void *)v90 != v70) {
            objc_enumerationMutation(v67);
          }
          v72 = [*(id *)(*((void *)&v89 + 1) + 8 * (void)jj) dictionaryRepresentation];
          [v66 addObject:v72];
        }
        id v69 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v89 objects:v117 count:16];
      }
      while (v69);
    }

    [v3 setObject:v66 forKey:@"activeLightweightParticipants"];
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v73 = +[NSNumber numberWithBool:self->_guestModeEnabled];
    [v3 setObject:v73 forKey:@"guestModeEnabled"];
  }
  highlightIdentifier = self->_highlightIdentifier;
  if (highlightIdentifier) {
    [v3 setObject:highlightIdentifier forKey:@"highlightIdentifier"];
  }
  joinedMetadata = self->_joinedMetadata;
  if (joinedMetadata)
  {
    v76 = [(CSDMessagingConversationJoinedMetadata *)joinedMetadata dictionaryRepresentation];
    [v3 setObject:v76 forKey:@"joinedMetadata"];
  }
  stagedActivitySession = self->_stagedActivitySession;
  if (stagedActivitySession)
  {
    v78 = [(CSDMessagingConversationActivitySession *)stagedActivitySession dictionaryRepresentation];
    [v3 setObject:v78 forKey:@"stagedActivitySession"];
  }
  __int16 v79 = (__int16)self->_has;
  if (v79)
  {
    uint64_t avMode = self->_avMode;
    if (avMode >= 3)
    {
      v81 = +[NSString stringWithFormat:@"(unknown: %i)", self->_avMode];
    }
    else
    {
      v81 = off_100509A38[avMode];
    }
    [v3 setObject:v81 forKey:@"avMode"];

    __int16 v79 = (__int16)self->_has;
  }
  if ((v79 & 0x10) != 0)
  {
    v82 = +[NSNumber numberWithInt:self->_requestBlobRecoveryOptions];
    [v3 setObject:v82 forKey:@"requestBlobRecoveryOptions"];
  }
  screenShareContext = self->_screenShareContext;
  if (screenShareContext)
  {
    v84 = [(CSDMessagingScreenShareContext *)screenShareContext dictionaryRepresentation];
    [v3 setObject:v84 forKey:@"screenShareContext"];
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    uint64_t presentationMode = self->_presentationMode;
    if (presentationMode >= 3)
    {
      v86 = +[NSString stringWithFormat:@"(unknown: %i)", self->_presentationMode];
    }
    else
    {
      v86 = off_100509A50[presentationMode];
    }
    [v3 setObject:v86 forKey:@"presentationMode"];
  }
  id v87 = v3;

  return v87;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001ACDD0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v6 = self->_activeParticipants;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v67;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v67 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v8);
  }

  if (self->_conversationGroupUUIDString) {
    PBDataWriterWriteStringField();
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v11 = self->_addedMembers;
  long long v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v12)
  {
    long long v13 = v12;
    uint64_t v14 = *(void *)v63;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v63 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      long long v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v13);
  }

  if ((*(_WORD *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_protoUpgradeSessionUUID) {
    PBDataWriterWriteStringField();
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v16 = self->_activitySessions;
  id v17 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v59;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v59 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v18);
  }

  if (self->_nickname) {
    PBDataWriterWriteStringField();
  }
  if (self->_link) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_reportData) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_encryptedMessage) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_letMeInDelegationHandle) {
    PBDataWriterWriteStringField();
  }
  if (self->_letMeInDelegationUUID) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v21 = self->_invitationPreferences;
  v22 = (char *)[(NSMutableArray *)v21 countByEnumeratingWithState:&v54 objects:v73 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v55;
    do
    {
      id v25 = 0;
      do
      {
        if (*(void *)v55 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      id v23 = (char *)[(NSMutableArray *)v21 countByEnumeratingWithState:&v54 objects:v73 count:16];
    }
    while (v23);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v26 = self->_removedMembers;
  uint64_t v27 = (char *)[(NSMutableArray *)v26 countByEnumeratingWithState:&v50 objects:v72 count:16];
  if (v27)
  {
    v28 = v27;
    uint64_t v29 = *(void *)v51;
    do
    {
      v30 = 0;
      do
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      v28 = (char *)[(NSMutableArray *)v26 countByEnumeratingWithState:&v50 objects:v72 count:16];
    }
    while (v28);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v31 = self->_lightweightMembers;
  v32 = (char *)[(NSMutableArray *)v31 countByEnumeratingWithState:&v46 objects:v71 count:16];
  if (v32)
  {
    v33 = v32;
    uint64_t v34 = *(void *)v47;
    do
    {
      v35 = 0;
      do
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      v33 = (char *)[(NSMutableArray *)v31 countByEnumeratingWithState:&v46 objects:v71 count:16];
    }
    while (v33);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v36 = self->_activeLightweightParticipants;
  v37 = (char *)[(NSMutableArray *)v36 countByEnumeratingWithState:&v42 objects:v70 count:16];
  if (v37)
  {
    v38 = v37;
    uint64_t v39 = *(void *)v43;
    do
    {
      v40 = 0;
      do
      {
        if (*(void *)v43 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteSubmessage();
        ++v40;
      }
      while (v38 != v40);
      v38 = (char *)[(NSMutableArray *)v36 countByEnumeratingWithState:&v42 objects:v70 count:16];
    }
    while (v38);
  }

  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_highlightIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_joinedMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_stagedActivitySession) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v41 = (__int16)self->_has;
  if (v41)
  {
    PBDataWriterWriteInt32Field();
    __int16 v41 = (__int16)self->_has;
  }
  if ((v41 & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_screenShareContext) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
    if ((has & 0x20) == 0) {
      goto LABEL_3;
    }
LABEL_75:
    v4[48] = self->_type;
    *((_WORD *)v4 + 102) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v4[49] = self->_version;
  *((_WORD *)v4 + 102) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_75;
  }
LABEL_3:
  if ((has & 0x200) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 202) = self->_shouldSuppressInCallUI;
    *((_WORD *)v4 + 102) |= 0x200u;
  }
LABEL_5:
  id v37 = v4;
  if ([(CSDMessagingConversationMessage *)self activeParticipantsCount])
  {
    [v37 clearActiveParticipants];
    unint64_t v6 = [(CSDMessagingConversationMessage *)self activeParticipantsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CSDMessagingConversationMessage *)self activeParticipantsAtIndex:i];
        [v37 addActiveParticipants:v9];
      }
    }
  }
  if (self->_conversationGroupUUIDString) {
    objc_msgSend(v37, "setConversationGroupUUIDString:");
  }
  if ([(CSDMessagingConversationMessage *)self addedMembersCount])
  {
    [v37 clearAddedMembers];
    unint64_t v10 = [(CSDMessagingConversationMessage *)self addedMembersCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        long long v13 = [(CSDMessagingConversationMessage *)self addedMembersAtIndex:j];
        [v37 addAddedMembers:v13];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v37 + 14) = self->_disconnectedReason;
    *((_WORD *)v37 + 102) |= 2u;
  }
  if (self->_protoUpgradeSessionUUID) {
    objc_msgSend(v37, "setProtoUpgradeSessionUUID:");
  }
  if ([(CSDMessagingConversationMessage *)self activitySessionsCount])
  {
    [v37 clearActivitySessions];
    unint64_t v14 = [(CSDMessagingConversationMessage *)self activitySessionsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        id v17 = [(CSDMessagingConversationMessage *)self activitySessionsAtIndex:k];
        [v37 addActivitySessions:v17];
      }
    }
  }
  if (self->_nickname) {
    objc_msgSend(v37, "setNickname:");
  }
  uint64_t v18 = v37;
  if (self->_link)
  {
    objc_msgSend(v37, "setLink:");
    uint64_t v18 = v37;
  }
  if (self->_reportData)
  {
    objc_msgSend(v37, "setReportData:");
    uint64_t v18 = v37;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v18[201] = self->_isLetMeInApproved;
    *((_WORD *)v18 + 102) |= 0x100u;
  }
  if (self->_encryptedMessage)
  {
    objc_msgSend(v37, "setEncryptedMessage:");
    uint64_t v18 = v37;
  }
  if (self->_letMeInDelegationHandle)
  {
    objc_msgSend(v37, "setLetMeInDelegationHandle:");
    uint64_t v18 = v37;
  }
  if (self->_letMeInDelegationUUID)
  {
    objc_msgSend(v37, "setLetMeInDelegationUUID:");
    uint64_t v18 = v37;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v18 + 15) = self->_enclosedEncryptedType;
    *((_WORD *)v18 + 102) |= 4u;
  }
  if ([(CSDMessagingConversationMessage *)self invitationPreferencesCount])
  {
    [v37 clearInvitationPreferences];
    unint64_t v19 = [(CSDMessagingConversationMessage *)self invitationPreferencesCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        v22 = [(CSDMessagingConversationMessage *)self invitationPreferencesAtIndex:m];
        [v37 addInvitationPreferences:v22];
      }
    }
  }
  if ([(CSDMessagingConversationMessage *)self removedMembersCount])
  {
    [v37 clearRemovedMembers];
    unint64_t v23 = [(CSDMessagingConversationMessage *)self removedMembersCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (uint64_t n = 0; n != v24; ++n)
      {
        id v26 = [(CSDMessagingConversationMessage *)self removedMembersAtIndex:n];
        [v37 addRemovedMembers:v26];
      }
    }
  }
  if ([(CSDMessagingConversationMessage *)self lightweightMembersCount])
  {
    [v37 clearLightweightMembers];
    unint64_t v27 = [(CSDMessagingConversationMessage *)self lightweightMembersCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (iuint64_t i = 0; ii != v28; ++ii)
      {
        v30 = [(CSDMessagingConversationMessage *)self lightweightMembersAtIndex:ii];
        [v37 addLightweightMembers:v30];
      }
    }
  }
  if ([(CSDMessagingConversationMessage *)self activeLightweightParticipantsCount])
  {
    [v37 clearActiveLightweightParticipants];
    unint64_t v31 = [(CSDMessagingConversationMessage *)self activeLightweightParticipantsCount];
    if (v31)
    {
      unint64_t v32 = v31;
      for (juint64_t j = 0; jj != v32; ++jj)
      {
        uint64_t v34 = [(CSDMessagingConversationMessage *)self activeLightweightParticipantsAtIndex:jj];
        [v37 addActiveLightweightParticipants:v34];
      }
    }
  }
  v35 = v37;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((unsigned char *)v37 + 200) = self->_guestModeEnabled;
    *((_WORD *)v37 + 102) |= 0x80u;
  }
  if (self->_highlightIdentifier)
  {
    objc_msgSend(v37, "setHighlightIdentifier:");
    v35 = v37;
  }
  if (self->_joinedMetadata)
  {
    objc_msgSend(v37, "setJoinedMetadata:");
    v35 = v37;
  }
  if (self->_stagedActivitySession)
  {
    objc_msgSend(v37, "setStagedActivitySession:");
    v35 = v37;
  }
  __int16 v36 = (__int16)self->_has;
  if (v36)
  {
    v35[10] = self->_avMode;
    *((_WORD *)v35 + 102) |= 1u;
    __int16 v36 = (__int16)self->_has;
  }
  if ((v36 & 0x10) != 0)
  {
    v35[42] = self->_requestBlobRecoveryOptions;
    *((_WORD *)v35 + 102) |= 0x10u;
  }
  if (self->_screenShareContext)
  {
    objc_msgSend(v37, "setScreenShareContext:");
    v35 = v37;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v35[34] = self->_presentationMode;
    *((_WORD *)v35 + 102) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v5[49] = self->_version;
    *((_WORD *)v5 + 102) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v5[48] = self->_type;
  *((_WORD *)v5 + 102) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    *((unsigned char *)v5 + 202) = self->_shouldSuppressInCallUI;
    *((_WORD *)v5 + 102) |= 0x200u;
  }
LABEL_5:
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v8 = self->_activeParticipants;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v100 objects:v110 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v101;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v101 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v100 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v6 addActiveParticipants:v13];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v100 objects:v110 count:16];
    }
    while (v10);
  }

  id v14 = [(NSString *)self->_conversationGroupUUIDString copyWithZone:a3];
  unint64_t v15 = (void *)*((void *)v6 + 6);
  *((void *)v6 + 6) = v14;

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v16 = self->_addedMembers;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v96 objects:v109 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v97;
    do
    {
      unint64_t v20 = 0;
      do
      {
        if (*(void *)v97 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v96 + 1) + 8 * (void)v20) copyWithZone:a3];
        [v6 addAddedMembers:v21];

        unint64_t v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v96 objects:v109 count:16];
    }
    while (v18);
  }

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 14) = self->_disconnectedReason;
    *((_WORD *)v6 + 102) |= 2u;
  }
  id v22 = [(NSString *)self->_protoUpgradeSessionUUID copyWithZone:a3];
  unint64_t v23 = (void *)*((void *)v6 + 18);
  *((void *)v6 + 18) = v22;

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  unint64_t v24 = self->_activitySessions;
  id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v92 objects:v108 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v93;
    do
    {
      unint64_t v28 = 0;
      do
      {
        if (*(void *)v93 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = [*(id *)(*((void *)&v92 + 1) + 8 * (void)v28) copyWithZone:a3];
        [v6 addActivitySessions:v29];

        unint64_t v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v92 objects:v108 count:16];
    }
    while (v26);
  }

  id v30 = [(NSString *)self->_nickname copyWithZone:a3];
  unint64_t v31 = (void *)*((void *)v6 + 16);
  *((void *)v6 + 16) = v30;

  id v32 = [(CSDMessagingConversationLink *)self->_link copyWithZone:a3];
  v33 = (void *)*((void *)v6 + 15);
  *((void *)v6 + 15) = v32;

  id v34 = [(CSDMessagingConversationReport *)self->_reportData copyWithZone:a3];
  v35 = (void *)*((void *)v6 + 20);
  *((void *)v6 + 20) = v34;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((unsigned char *)v6 + 201) = self->_isLetMeInApproved;
    *((_WORD *)v6 + 102) |= 0x100u;
  }
  id v36 = [(CSDMessagingEncryptedConversationMessage *)self->_encryptedMessage copyWithZone:a3];
  id v37 = (void *)*((void *)v6 + 8);
  *((void *)v6 + 8) = v36;

  id v38 = [(NSString *)self->_letMeInDelegationHandle copyWithZone:a3];
  uint64_t v39 = (void *)*((void *)v6 + 12);
  *((void *)v6 + 12) = v38;

  id v40 = [(NSString *)self->_letMeInDelegationUUID copyWithZone:a3];
  __int16 v41 = (void *)*((void *)v6 + 13);
  *((void *)v6 + 13) = v40;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_enclosedEncryptedType;
    *((_WORD *)v6 + 102) |= 4u;
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v42 = self->_invitationPreferences;
  id v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v88 objects:v107 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v89;
    do
    {
      long long v46 = 0;
      do
      {
        if (*(void *)v89 != v45) {
          objc_enumerationMutation(v42);
        }
        id v47 = [*(id *)(*((void *)&v88 + 1) + 8 * (void)v46) copyWithZone:a3];
        [v6 addInvitationPreferences:v47];

        long long v46 = (char *)v46 + 1;
      }
      while (v44 != v46);
      id v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v88 objects:v107 count:16];
    }
    while (v44);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v48 = self->_removedMembers;
  id v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v84 objects:v106 count:16];
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v85;
    do
    {
      long long v52 = 0;
      do
      {
        if (*(void *)v85 != v51) {
          objc_enumerationMutation(v48);
        }
        id v53 = [*(id *)(*((void *)&v84 + 1) + 8 * (void)v52) copyWithZone:a3];
        [v6 addRemovedMembers:v53];

        long long v52 = (char *)v52 + 1;
      }
      while (v50 != v52);
      id v50 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v84 objects:v106 count:16];
    }
    while (v50);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v54 = self->_lightweightMembers;
  id v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v80 objects:v105 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v81;
    do
    {
      long long v58 = 0;
      do
      {
        if (*(void *)v81 != v57) {
          objc_enumerationMutation(v54);
        }
        id v59 = [*(id *)(*((void *)&v80 + 1) + 8 * (void)v58) copyWithZone:a3];
        [v6 addLightweightMembers:v59];

        long long v58 = (char *)v58 + 1;
      }
      while (v56 != v58);
      id v56 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v80 objects:v105 count:16];
    }
    while (v56);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v60 = self->_activeLightweightParticipants;
  id v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v76 objects:v104 count:16];
  if (v61)
  {
    id v62 = v61;
    uint64_t v63 = *(void *)v77;
    do
    {
      long long v64 = 0;
      do
      {
        if (*(void *)v77 != v63) {
          objc_enumerationMutation(v60);
        }
        id v65 = objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * (void)v64), "copyWithZone:", a3, (void)v76);
        [v6 addActiveLightweightParticipants:v65];

        long long v64 = (char *)v64 + 1;
      }
      while (v62 != v64);
      id v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v76 objects:v104 count:16];
    }
    while (v62);
  }

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((unsigned char *)v6 + 200) = self->_guestModeEnabled;
    *((_WORD *)v6 + 102) |= 0x80u;
  }
  id v66 = -[NSString copyWithZone:](self->_highlightIdentifier, "copyWithZone:", a3, (void)v76);
  long long v67 = (void *)*((void *)v6 + 9);
  *((void *)v6 + 9) = v66;

  id v68 = [(CSDMessagingConversationJoinedMetadata *)self->_joinedMetadata copyWithZone:a3];
  long long v69 = (void *)*((void *)v6 + 11);
  *((void *)v6 + 11) = v68;

  id v70 = [(CSDMessagingConversationActivitySession *)self->_stagedActivitySession copyWithZone:a3];
  v71 = (void *)*((void *)v6 + 23);
  *((void *)v6 + 23) = v70;

  __int16 v72 = (__int16)self->_has;
  if (v72)
  {
    *((_DWORD *)v6 + 10) = self->_avMode;
    *((_WORD *)v6 + 102) |= 1u;
    __int16 v72 = (__int16)self->_has;
  }
  if ((v72 & 0x10) != 0)
  {
    *((_DWORD *)v6 + 42) = self->_requestBlobRecoveryOptions;
    *((_WORD *)v6 + 102) |= 0x10u;
  }
  id v73 = [(CSDMessagingScreenShareContext *)self->_screenShareContext copyWithZone:a3];
  v74 = (void *)*((void *)v6 + 22);
  *((void *)v6 + 22) = v73;

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v6 + 34) = self->_presentationMode;
    *((_WORD *)v6 + 102) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_100;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 102);
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_version != *((_DWORD *)v4 + 49)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_100;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_type != *((_DWORD *)v4 + 48)) {
      goto LABEL_100;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x200) == 0) {
      goto LABEL_100;
    }
    if (self->_shouldSuppressInCallUI)
    {
      if (!*((unsigned char *)v4 + 202)) {
        goto LABEL_100;
      }
    }
    else if (*((unsigned char *)v4 + 202))
    {
      goto LABEL_100;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
    goto LABEL_100;
  }
  activeParticipants = self->_activeParticipants;
  if ((unint64_t)activeParticipants | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](activeParticipants, "isEqual:"))
  {
    goto LABEL_100;
  }
  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if ((unint64_t)conversationGroupUUIDString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](conversationGroupUUIDString, "isEqual:")) {
      goto LABEL_100;
    }
  }
  addedMembers = self->_addedMembers;
  if ((unint64_t)addedMembers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](addedMembers, "isEqual:")) {
      goto LABEL_100;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_disconnectedReason != *((_DWORD *)v4 + 14)) {
      goto LABEL_100;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_100;
  }
  protoUpgradeSessionUUID = self->_protoUpgradeSessionUUID;
  if ((unint64_t)protoUpgradeSessionUUID | *((void *)v4 + 18)
    && !-[NSString isEqual:](protoUpgradeSessionUUID, "isEqual:"))
  {
    goto LABEL_100;
  }
  activitySessions = self->_activitySessions;
  if ((unint64_t)activitySessions | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](activitySessions, "isEqual:")) {
      goto LABEL_100;
    }
  }
  nickname = self->_nickname;
  if ((unint64_t)nickname | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](nickname, "isEqual:")) {
      goto LABEL_100;
    }
  }
  linuint64_t k = self->_link;
  if ((unint64_t)link | *((void *)v4 + 15))
  {
    if (!-[CSDMessagingConversationLink isEqual:](link, "isEqual:")) {
      goto LABEL_100;
    }
  }
  reportData = self->_reportData;
  if ((unint64_t)reportData | *((void *)v4 + 20))
  {
    if (!-[CSDMessagingConversationReport isEqual:](reportData, "isEqual:")) {
      goto LABEL_100;
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x100) == 0) {
      goto LABEL_100;
    }
    if (self->_isLetMeInApproved)
    {
      if (!*((unsigned char *)v4 + 201)) {
        goto LABEL_100;
      }
    }
    else if (*((unsigned char *)v4 + 201))
    {
      goto LABEL_100;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
    goto LABEL_100;
  }
  encryptedMessage = self->_encryptedMessage;
  if ((unint64_t)encryptedMessage | *((void *)v4 + 8)
    && !-[CSDMessagingEncryptedConversationMessage isEqual:](encryptedMessage, "isEqual:"))
  {
    goto LABEL_100;
  }
  letMeInDelegationHandle = self->_letMeInDelegationHandle;
  if ((unint64_t)letMeInDelegationHandle | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](letMeInDelegationHandle, "isEqual:")) {
      goto LABEL_100;
    }
  }
  letMeInDelegationUUID = self->_letMeInDelegationUUID;
  if ((unint64_t)letMeInDelegationUUID | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](letMeInDelegationUUID, "isEqual:")) {
      goto LABEL_100;
    }
  }
  __int16 v19 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_enclosedEncryptedType != *((_DWORD *)v4 + 15)) {
      goto LABEL_100;
    }
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_100;
  }
  invitationPreferences = self->_invitationPreferences;
  if ((unint64_t)invitationPreferences | *((void *)v4 + 10)
    && !-[NSMutableArray isEqual:](invitationPreferences, "isEqual:"))
  {
    goto LABEL_100;
  }
  removedMembers = self->_removedMembers;
  if ((unint64_t)removedMembers | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](removedMembers, "isEqual:")) {
      goto LABEL_100;
    }
  }
  lightweightMembers = self->_lightweightMembers;
  if ((unint64_t)lightweightMembers | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](lightweightMembers, "isEqual:")) {
      goto LABEL_100;
    }
  }
  activeLightweightParticipants = self->_activeLightweightParticipants;
  if ((unint64_t)activeLightweightParticipants | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](activeLightweightParticipants, "isEqual:")) {
      goto LABEL_100;
    }
  }
  __int16 v24 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v24 & 0x80) == 0) {
      goto LABEL_100;
    }
    if (self->_guestModeEnabled)
    {
      if (!*((unsigned char *)v4 + 200)) {
        goto LABEL_100;
      }
    }
    else if (*((unsigned char *)v4 + 200))
    {
      goto LABEL_100;
    }
  }
  else if ((v24 & 0x80) != 0)
  {
    goto LABEL_100;
  }
  highlightIdentifier = self->_highlightIdentifier;
  if ((unint64_t)highlightIdentifier | *((void *)v4 + 9)
    && !-[NSString isEqual:](highlightIdentifier, "isEqual:"))
  {
    goto LABEL_100;
  }
  joinedMetadata = self->_joinedMetadata;
  if ((unint64_t)joinedMetadata | *((void *)v4 + 11))
  {
    if (!-[CSDMessagingConversationJoinedMetadata isEqual:](joinedMetadata, "isEqual:")) {
      goto LABEL_100;
    }
  }
  stagedActivitySessiouint64_t n = self->_stagedActivitySession;
  if ((unint64_t)stagedActivitySession | *((void *)v4 + 23))
  {
    if (!-[CSDMessagingConversationActivitySession isEqual:](stagedActivitySession, "isEqual:")) {
      goto LABEL_100;
    }
  }
  __int16 v28 = (__int16)self->_has;
  __int16 v29 = *((_WORD *)v4 + 102);
  if (v28)
  {
    if ((v29 & 1) == 0 || self->_avMode != *((_DWORD *)v4 + 10)) {
      goto LABEL_100;
    }
  }
  else if (v29)
  {
    goto LABEL_100;
  }
  if ((v28 & 0x10) != 0)
  {
    if ((v29 & 0x10) == 0 || self->_requestBlobRecoveryOptions != *((_DWORD *)v4 + 42)) {
      goto LABEL_100;
    }
  }
  else if ((v29 & 0x10) != 0)
  {
    goto LABEL_100;
  }
  screenShareContext = self->_screenShareContext;
  if ((unint64_t)screenShareContext | *((void *)v4 + 22))
  {
    if (-[CSDMessagingScreenShareContext isEqual:](screenShareContext, "isEqual:"))
    {
      __int16 v28 = (__int16)self->_has;
      goto LABEL_95;
    }
LABEL_100:
    BOOL v32 = 0;
    goto LABEL_101;
  }
LABEL_95:
  __int16 v31 = *((_WORD *)v4 + 102);
  if ((v28 & 8) != 0)
  {
    if ((v31 & 8) == 0 || self->_presentationMode != *((_DWORD *)v4 + 34)) {
      goto LABEL_100;
    }
    BOOL v32 = 1;
  }
  else
  {
    BOOL v32 = (v31 & 8) == 0;
  }
LABEL_101:

  return v32;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
    uint64_t v34 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v33 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v34 = 2654435761 * self->_version;
  if ((has & 0x20) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v33 = 2654435761 * self->_type;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    uint64_t v32 = 2654435761 * self->_shouldSuppressInCallUI;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v32 = 0;
LABEL_8:
  unint64_t v31 = (unint64_t)[(NSMutableArray *)self->_activeParticipants hash];
  NSUInteger v30 = [(NSString *)self->_conversationGroupUUIDString hash];
  unint64_t v29 = (unint64_t)[(NSMutableArray *)self->_addedMembers hash];
  if ((*(_WORD *)&self->_has & 2) != 0) {
    uint64_t v28 = 2654435761 * self->_disconnectedReason;
  }
  else {
    uint64_t v28 = 0;
  }
  NSUInteger v27 = [(NSString *)self->_protoUpgradeSessionUUID hash];
  unint64_t v26 = (unint64_t)[(NSMutableArray *)self->_activitySessions hash];
  NSUInteger v25 = [(NSString *)self->_nickname hash];
  unint64_t v24 = [(CSDMessagingConversationLink *)self->_link hash];
  unint64_t v23 = [(CSDMessagingConversationReport *)self->_reportData hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v22 = 2654435761 * self->_isLetMeInApproved;
  }
  else {
    uint64_t v22 = 0;
  }
  unint64_t v21 = [(CSDMessagingEncryptedConversationMessage *)self->_encryptedMessage hash];
  NSUInteger v20 = [(NSString *)self->_letMeInDelegationHandle hash];
  NSUInteger v19 = [(NSString *)self->_letMeInDelegationUUID hash];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    uint64_t v18 = 2654435761 * self->_enclosedEncryptedType;
  }
  else {
    uint64_t v18 = 0;
  }
  unint64_t v17 = (unint64_t)[(NSMutableArray *)self->_invitationPreferences hash];
  unint64_t v16 = (unint64_t)[(NSMutableArray *)self->_removedMembers hash];
  unint64_t v15 = (unint64_t)[(NSMutableArray *)self->_lightweightMembers hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_activeLightweightParticipants hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v5 = 2654435761 * self->_guestModeEnabled;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_highlightIdentifier hash];
  unint64_t v7 = [(CSDMessagingConversationJoinedMetadata *)self->_joinedMetadata hash];
  unint64_t v8 = [(CSDMessagingConversationActivitySession *)self->_stagedActivitySession hash];
  __int16 v9 = (__int16)self->_has;
  if (v9)
  {
    uint64_t v10 = 2654435761 * self->_avMode;
    if ((v9 & 0x10) != 0) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((v9 & 0x10) != 0)
    {
LABEL_22:
      uint64_t v11 = 2654435761 * self->_requestBlobRecoveryOptions;
      goto LABEL_25;
    }
  }
  uint64_t v11 = 0;
LABEL_25:
  unint64_t v12 = [(CSDMessagingScreenShareContext *)self->_screenShareContext hash];
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v13 = 2654435761 * self->_presentationMode;
  }
  else {
    uint64_t v13 = 0;
  }
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 102);
  if ((v6 & 0x40) != 0)
  {
    self->_versiouint64_t n = *((_DWORD *)v4 + 49);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v6 = *((_WORD *)v4 + 102);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 0x200) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_unsigned int type = *((_DWORD *)v4 + 48);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
LABEL_4:
    self->_shouldSuppressInCallUI = *((unsigned char *)v4 + 202);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_5:
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v7 = *((id *)v4 + 2);
  id v8 = [v7 countByEnumeratingWithState:&v79 objects:v89 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v80 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CSDMessagingConversationMessage *)self addActiveParticipants:*(void *)(*((void *)&v79 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v79 objects:v89 count:16];
    }
    while (v9);
  }

  if (*((void *)v5 + 6)) {
    -[CSDMessagingConversationMessage setConversationGroupUUIDString:](self, "setConversationGroupUUIDString:");
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v12 = *((id *)v5 + 4);
  id v13 = [v12 countByEnumeratingWithState:&v75 objects:v88 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v76 != v15) {
          objc_enumerationMutation(v12);
        }
        [(CSDMessagingConversationMessage *)self addAddedMembers:*(void *)(*((void *)&v75 + 1) + 8 * (void)j)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v75 objects:v88 count:16];
    }
    while (v14);
  }

  if ((*((_WORD *)v5 + 102) & 2) != 0)
  {
    self->_disconnectedReasouint64_t n = *((_DWORD *)v5 + 14);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 18)) {
    -[CSDMessagingConversationMessage setProtoUpgradeSessionUUID:](self, "setProtoUpgradeSessionUUID:");
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v17 = *((id *)v5 + 3);
  id v18 = [v17 countByEnumeratingWithState:&v71 objects:v87 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v72;
    do
    {
      for (uint64_t k = 0; k != v19; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v72 != v20) {
          objc_enumerationMutation(v17);
        }
        [(CSDMessagingConversationMessage *)self addActivitySessions:*(void *)(*((void *)&v71 + 1) + 8 * (void)k)];
      }
      id v19 = [v17 countByEnumeratingWithState:&v71 objects:v87 count:16];
    }
    while (v19);
  }

  if (*((void *)v5 + 16)) {
    -[CSDMessagingConversationMessage setNickname:](self, "setNickname:");
  }
  linuint64_t k = self->_link;
  uint64_t v23 = *((void *)v5 + 15);
  if (link)
  {
    if (v23) {
      -[CSDMessagingConversationLink mergeFrom:](link, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[CSDMessagingConversationMessage setLink:](self, "setLink:");
  }
  reportData = self->_reportData;
  uint64_t v25 = *((void *)v5 + 20);
  if (reportData)
  {
    if (v25) {
      -[CSDMessagingConversationReport mergeFrom:](reportData, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[CSDMessagingConversationMessage setReportData:](self, "setReportData:");
  }
  if ((*((_WORD *)v5 + 102) & 0x100) != 0)
  {
    self->_isLetMeInApproved = *((unsigned char *)v5 + 201);
    *(_WORD *)&self->_has |= 0x100u;
  }
  encryptedMessage = self->_encryptedMessage;
  uint64_t v27 = *((void *)v5 + 8);
  if (encryptedMessage)
  {
    if (v27) {
      -[CSDMessagingEncryptedConversationMessage mergeFrom:](encryptedMessage, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[CSDMessagingConversationMessage setEncryptedMessage:](self, "setEncryptedMessage:");
  }
  if (*((void *)v5 + 12)) {
    -[CSDMessagingConversationMessage setLetMeInDelegationHandle:](self, "setLetMeInDelegationHandle:");
  }
  if (*((void *)v5 + 13)) {
    -[CSDMessagingConversationMessage setLetMeInDelegationUUID:](self, "setLetMeInDelegationUUID:");
  }
  if ((*((_WORD *)v5 + 102) & 4) != 0)
  {
    self->_unsigned int enclosedEncryptedType = *((_DWORD *)v5 + 15);
    *(_WORD *)&self->_has |= 4u;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v28 = *((id *)v5 + 10);
  id v29 = [v28 countByEnumeratingWithState:&v67 objects:v86 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v68;
    do
    {
      for (uint64_t m = 0; m != v30; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v68 != v31) {
          objc_enumerationMutation(v28);
        }
        [(CSDMessagingConversationMessage *)self addInvitationPreferences:*(void *)(*((void *)&v67 + 1) + 8 * (void)m)];
      }
      id v30 = [v28 countByEnumeratingWithState:&v67 objects:v86 count:16];
    }
    while (v30);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v33 = *((id *)v5 + 19);
  id v34 = [v33 countByEnumeratingWithState:&v63 objects:v85 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v64;
    do
    {
      for (uint64_t n = 0; n != v35; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v64 != v36) {
          objc_enumerationMutation(v33);
        }
        [(CSDMessagingConversationMessage *)self addRemovedMembers:*(void *)(*((void *)&v63 + 1) + 8 * (void)n)];
      }
      id v35 = [v33 countByEnumeratingWithState:&v63 objects:v85 count:16];
    }
    while (v35);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v38 = *((id *)v5 + 14);
  id v39 = [v38 countByEnumeratingWithState:&v59 objects:v84 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v60;
    do
    {
      for (iuint64_t i = 0; ii != v40; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v60 != v41) {
          objc_enumerationMutation(v38);
        }
        [(CSDMessagingConversationMessage *)self addLightweightMembers:*(void *)(*((void *)&v59 + 1) + 8 * (void)ii)];
      }
      id v40 = [v38 countByEnumeratingWithState:&v59 objects:v84 count:16];
    }
    while (v40);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v43 = *((id *)v5 + 1);
  id v44 = [v43 countByEnumeratingWithState:&v55 objects:v83 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v56;
    do
    {
      for (juint64_t j = 0; jj != v45; juint64_t j = (char *)jj + 1)
      {
        if (*(void *)v56 != v46) {
          objc_enumerationMutation(v43);
        }
        -[CSDMessagingConversationMessage addActiveLightweightParticipants:](self, "addActiveLightweightParticipants:", *(void *)(*((void *)&v55 + 1) + 8 * (void)jj), (void)v55);
      }
      id v45 = [v43 countByEnumeratingWithState:&v55 objects:v83 count:16];
    }
    while (v45);
  }

  if ((*((_WORD *)v5 + 102) & 0x80) != 0)
  {
    self->_guestModeEnabled = *((unsigned char *)v5 + 200);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v5 + 9)) {
    -[CSDMessagingConversationMessage setHighlightIdentifier:](self, "setHighlightIdentifier:");
  }
  joinedMetadata = self->_joinedMetadata;
  uint64_t v49 = *((void *)v5 + 11);
  if (joinedMetadata)
  {
    if (v49) {
      -[CSDMessagingConversationJoinedMetadata mergeFrom:](joinedMetadata, "mergeFrom:");
    }
  }
  else if (v49)
  {
    -[CSDMessagingConversationMessage setJoinedMetadata:](self, "setJoinedMetadata:");
  }
  stagedActivitySessiouint64_t n = self->_stagedActivitySession;
  uint64_t v51 = *((void *)v5 + 23);
  if (stagedActivitySession)
  {
    if (v51) {
      -[CSDMessagingConversationActivitySession mergeFrom:](stagedActivitySession, "mergeFrom:");
    }
  }
  else if (v51)
  {
    -[CSDMessagingConversationMessage setStagedActivitySession:](self, "setStagedActivitySession:");
  }
  __int16 v52 = *((_WORD *)v5 + 102);
  if (v52)
  {
    self->_uint64_t avMode = *((_DWORD *)v5 + 10);
    *(_WORD *)&self->_has |= 1u;
    __int16 v52 = *((_WORD *)v5 + 102);
  }
  if ((v52 & 0x10) != 0)
  {
    self->_requestBlobRecoveryOptions = *((_DWORD *)v5 + 42);
    *(_WORD *)&self->_has |= 0x10u;
  }
  screenShareContext = self->_screenShareContext;
  uint64_t v54 = *((void *)v5 + 22);
  if (screenShareContext)
  {
    if (v54) {
      -[CSDMessagingScreenShareContext mergeFrom:](screenShareContext, "mergeFrom:");
    }
  }
  else if (v54)
  {
    -[CSDMessagingConversationMessage setScreenShareContext:](self, "setScreenShareContext:");
  }
  if ((*((_WORD *)v5 + 102) & 8) != 0)
  {
    self->_uint64_t presentationMode = *((_DWORD *)v5 + 34);
    *(_WORD *)&self->_has |= 8u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (NSMutableArray)activeParticipants
{
  return self->_activeParticipants;
}

- (void)setActiveParticipants:(id)a3
{
}

- (NSString)conversationGroupUUIDString
{
  return self->_conversationGroupUUIDString;
}

- (void)setConversationGroupUUIDString:(id)a3
{
}

- (NSMutableArray)addedMembers
{
  return self->_addedMembers;
}

- (void)setAddedMembers:(id)a3
{
}

- (unsigned)disconnectedReason
{
  return self->_disconnectedReason;
}

- (NSString)protoUpgradeSessionUUID
{
  return self->_protoUpgradeSessionUUID;
}

- (void)setProtoUpgradeSessionUUID:(id)a3
{
}

- (NSMutableArray)activitySessions
{
  return self->_activitySessions;
}

- (void)setActivitySessions:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (CSDMessagingConversationLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (CSDMessagingConversationReport)reportData
{
  return self->_reportData;
}

- (void)setReportData:(id)a3
{
}

- (BOOL)isLetMeInApproved
{
  return self->_isLetMeInApproved;
}

- (CSDMessagingEncryptedConversationMessage)encryptedMessage
{
  return self->_encryptedMessage;
}

- (void)setEncryptedMessage:(id)a3
{
}

- (NSString)letMeInDelegationHandle
{
  return self->_letMeInDelegationHandle;
}

- (void)setLetMeInDelegationHandle:(id)a3
{
}

- (NSString)letMeInDelegationUUID
{
  return self->_letMeInDelegationUUID;
}

- (void)setLetMeInDelegationUUID:(id)a3
{
}

- (NSMutableArray)invitationPreferences
{
  return self->_invitationPreferences;
}

- (void)setInvitationPreferences:(id)a3
{
}

- (NSMutableArray)removedMembers
{
  return self->_removedMembers;
}

- (void)setRemovedMembers:(id)a3
{
}

- (NSMutableArray)lightweightMembers
{
  return self->_lightweightMembers;
}

- (void)setLightweightMembers:(id)a3
{
}

- (NSMutableArray)activeLightweightParticipants
{
  return self->_activeLightweightParticipants;
}

- (void)setActiveLightweightParticipants:(id)a3
{
}

- (BOOL)guestModeEnabled
{
  return self->_guestModeEnabled;
}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (void)setHighlightIdentifier:(id)a3
{
}

- (CSDMessagingConversationJoinedMetadata)joinedMetadata
{
  return self->_joinedMetadata;
}

- (void)setJoinedMetadata:(id)a3
{
}

- (CSDMessagingConversationActivitySession)stagedActivitySession
{
  return self->_stagedActivitySession;
}

- (void)setStagedActivitySession:(id)a3
{
}

- (int)requestBlobRecoveryOptions
{
  return self->_requestBlobRecoveryOptions;
}

- (CSDMessagingScreenShareContext)screenShareContext
{
  return self->_screenShareContext;
}

- (void)setScreenShareContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedActivitySession, 0);
  objc_storeStrong((id *)&self->_screenShareContext, 0);
  objc_storeStrong((id *)&self->_reportData, 0);
  objc_storeStrong((id *)&self->_removedMembers, 0);
  objc_storeStrong((id *)&self->_protoUpgradeSessionUUID, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_lightweightMembers, 0);
  objc_storeStrong((id *)&self->_letMeInDelegationUUID, 0);
  objc_storeStrong((id *)&self->_letMeInDelegationHandle, 0);
  objc_storeStrong((id *)&self->_joinedMetadata, 0);
  objc_storeStrong((id *)&self->_invitationPreferences, 0);
  objc_storeStrong((id *)&self->_highlightIdentifier, 0);
  objc_storeStrong((id *)&self->_encryptedMessage, 0);
  objc_storeStrong((id *)&self->_conversationGroupUUIDString, 0);
  objc_storeStrong((id *)&self->_addedMembers, 0);
  objc_storeStrong((id *)&self->_activitySessions, 0);
  objc_storeStrong((id *)&self->_activeParticipants, 0);

  objc_storeStrong((id *)&self->_activeLightweightParticipants, 0);
}

@end